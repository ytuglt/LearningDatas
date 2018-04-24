### 规划

|主机名称|IP地址|功能|
|-|-|-|
|hadoop01|192.168.1.2|NameNode,DataNode,resourcemanager,nodemanager|
|hadoop02|192.168.1.3|DataNode,nodemanager|
|hadoop03|192.168.1.4|DataNode,nodemanager|

### 开始

	cd /usr/local/hadoop-3.0.1

### 配置hadoop-env.sh

	 vim ./etc/hadoop/hadoop-env.sh

配置 JAVA_HOME:

	# Technically, the only required environment variable is JAVA_HOME.
	# All others are optional.  However, the defaults are probably not
	# preferred.  Many sites configure these options outside of Hadoop,
	# such as in /etc/profile.d
	
	# The java implementation to use. By default, this environment
	# variable is REQUIRED on ALL platforms except OS X!
	export JAVA_HOME=/usr/local/jdk1.8.0_161/

### 配置core-site.xml

	vim ./etc/hadoop/core-site.xml

配置如下：

	<configuration>
	<!--配置hdfs文件系统的命名空间-->
	<property>
	<name>fs.defaultFS</name>
	<value>hdfs://hadoop01:9000</value>
	</property>
	
	<!--配置操作hdfs的缓存大小-->
	<property>
	<name>io.file.buffer.size</name>
	<value>4096</value>
	</property>
	
	<!--配置临时数据存储目录-->
	<property>
	<name>hadoop.tmp.dir</name>
	<value>/home/bigdata/tmp</value>
	</property>
	
	</configuration>

### 配置hdfs-site.xml 

	vim ./etc/hadoop/hdfs-site.xml

配置：

	<!--副本数-->
	<property>
	<name>dfs.replication</name>
	<value>3</value>
	</property>
	
	<!--块大小-->
	<property>
	<name>dfs.block.size</name>
	<value>268435456</value>
	</property>
	
	<!--hdfs的元数据存储位置-->
	<property>
	<name>dfs.namenode.name.dir</name>
	<value>/home/hadoopdata/dfs/name</value>
	</property>
	
	<!--hdfs的数据存储位置-->
	<property>
	<name>dfs.datanode.data.dir</name>
	<value>/home/hadoopdata/dfs/data</value>
	</property>
	
	<!--hdfs的检测目录-->
	<property>
	<name>fs.checkpoint.dir</name>
	<value>/home/hadoopdata/checkpoint/dfs/cname</value>
	</property>
	
	<!--hdfs的namenode的 web ui地址-->
	<property>
	<name>dfs.http.address</name>
	<value>hadoop01:50070</value>
	</property>
	
	<!--hdfs的secondary namenode 的 web ui 地址-->
	<property>
	<name>dfs.secondary.http.address</name>
	<value>hadoop01:50090</value>
	</property>
	
	<!--是否开启web操作hdfs-->
	<property>
	<name>dfs.webhdfs.enabled</name>
	<value>false</value>
	</property>
	
	<!--是否启用hdfs的权限(acl)-->
	<property>
	<name>dfs.permissions</name>
	<value>false</value>
	</property>


### 配置mapred-site.xml

	vim ./etc/hadoop/mapred-site.xml

配置：
	
	<!--指定mapreduce的运行框架-->
	<property>
	<name>mapreduce.framework.name</name>
	<value>yarn</value>
	<final>true</final>
	</property>
	
	<!--历史服务的通信地址-->
	<property>
	<name>mapreduce.jobhistory.address</name>
	<value>hadoop01:10020</value>
	</property>
	
	<!--历史服务的web ui地址-->
	<property>
	<name>mapreduce.jobhistory.webapp.address</name>
	<value>hadoop01:19888</value>
	</property>

### 配置yarn-site.xml

	vim ./etc/hadoop/yarn-site.xml

配置：

	<!--指定resourcemanager的服务主机名-->
	<property>
	<name>yarn.resourcemanager.hostname</name>
	<value>hadoop01</value>
	</property>
	
	<!--指定mapreduce的shuffle-->
	<property>
	<name>yarn.nodemanager.aux-services</name>
	<value>mapreduce-shuffle</value>
	</property>
	
	<!--指定resourcemanager的内部通信地址-->
	<property>
	<name>yarn.resourcemanager.address</name>
	<value>hadoop01:8032</value>
	</property>
	
	<!--指定resourcemanager的scheduler的内部通信地址-->
	<property>
	<name>yarn.resourcemanager.scheduler.address</name>
	<value>hadoop01:8030</value>
	</property>
	
	<!--指定resourcemanager的resource-tracker的内部通信地址-->
	<property>
	<name>yarn.resourcemanager.resource-tracker.address</name>
	<value>hadoop01:8031</value>
	</property>
	
	<!--指定resourcemanager的web ui监控地址-->
	<property>
	<name>yarn.resourcemanager.webapp.address</name>
	<value>hadoop01:8088</value>
	</property>

### 配置slaves（此文件在3.0版本没有，不确定是否新建配置还是不需要配置）

	vim ./etc/hadoop/slaves

配置：

	hadoop01
	hadoop02
	hadoop03
