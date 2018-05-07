### 不使用锁来保证Golang的并发安全

go语言自身提供了一种不使用锁来解决并发安全的行为那就是atomic.Value, 我们将指针指向golang 1.4 文档。

1.4中 在 Minor changes to the library 标记中新加了atomic.Value 类型，可以原子的加载和存储任意类型值，当我看到这个新提供的类型之后(1.4的时候)我很开心也很郁闷,因为官方包上写着

	Package atomic provides low-level atomic memory primitives useful for implementing synchronization algorithms.
	These functions require great care to be used correctly. Except for special, low-level applications, synchronization is better done with channels or the facilities of the sync package. Share memory by communicating; don't communicate by sharing memory.
	

所以我看完这句话也就继续在项目中使用锁和channel来处理并发安全，后来一个机会我看了下nsq的源码，发现里面大量的使用atomic.Value 于是在1.6之后我也开始在项目中大量的使用atomic.Value

	package main

	import (
		"fmt"
		"sync/atomic"
	)

	type Value struct {
		Key string
		Val interface{}
	}

	type Noaway struct {
		Movies atomic.Value
		Total  atomic.Value
	}

	func NewNoaway() *Noaway {
		n := new(Noaway)
		n.Movies.Store(&Value{Key: "movie", Val: "Wolf Warrior 2"})
		n.Total.Store("$2,539,306")
		return n
	}

	func main() {
		n := NewNoaway()
		val := n.Movies.Load().(*Value)
		total := n.Total.Load().(string)
		fmt.Printf("Movies %v domestic total as of Aug. 27, 2017: %v \n", val.Val, total)
	}
	
这个例子看起来很好，线程安全还没有锁，逻辑复杂的时候也不用使用defer了，我使用benchmark和锁对比一下看看是否是自己想要的结果：

	package noaway_test

	import (
		"sync"
		"sync/atomic"
		"testing"
	)

	type manager struct {
		sync.RWMutex
		agents int
	}

	func BenchmarkManagerLock(b *testing.B) {
		m := new(manager)
		b.ReportAllocs()
		b.RunParallel(func(pb *testing.PB) {
			for pb.Next() {
				m.Lock()
				m.agents = 100
				m.Unlock()
			}
		})
	}

	func BenchmarkManagerRLock(b *testing.B) {
		m := manager{agents: 100}
		b.ReportAllocs()
		b.RunParallel(func(pb *testing.PB) {
			for pb.Next() {
				m.RLock()
				_ = m.agents
				m.RUnlock()
			}
		})
	}

	func BenchmarkManagerAtomicValueStore(b *testing.B) {
		var managerVal atomic.Value
		m := manager{agents: 100}
		b.ReportAllocs()
		b.RunParallel(func(pb *testing.PB) {
			for pb.Next() {
				managerVal.Store(m)
			}
		})
	}

	func BenchmarkManagerAtomicValueLoad(b *testing.B) {
		var managerVal atomic.Value
		managerVal.Store(&manager{agents: 100})
		b.ReportAllocs()
		b.RunParallel(func(pb *testing.PB) {
			for pb.Next() {
				_ = managerVal.Load().(*manager)
			}
		})
	}
	
