# 1.快捷键

		1 The following keybindings can be used to control Terminator:
		  2 
		  3 //第一部份：关于在同一个标签内的操作
		  4 Ctrl+Shift+O
		  5 Split terminals Horizontally.    //水平分割终端
		  6 
		  7 Ctrl+Shift+E
		  8 Split terminals Vertically.    //垂直分割终端
		  9 
		 10 Ctrl+Shift+Right
		 11 Move parent dragbar Right.    //在垂直分割的终端中将分割条向右移动
		 12 
		 13 Ctrl+Shift+Left
		 14 Move parent dragbar Left.    //在垂直分割的终端中将分割条向左移动
		 15 
		 16 Ctrl+Shift+Up
		 17 Move parent dragbar Up.        //在水平分割的终端中将分割条向上移动
		 18 
		 19 Ctrl+Shift+Down
		 20 Move parent dragbar Down.    //在水平分割的终端中将分割条向下移动
		 21 
		 22 Ctrl+Shift+S
		 23 Hide/Show Scrollbar.        //隐藏/显示滚动条
		 24 
		 25 Ctrl+Shift+F
		 26 Search within terminal scrollback    //搜索
		 27 
		 28 Ctrl+Shift+N or Ctrl+Tab
		 29 Move to next terminal within the same tab, use Ctrl+PageDown to move to the next tab. If cycle_term_tab is False, cycle within the same tab will be disabled            //Crtl+Tab   移动到下一个终端
		 30 
		 31 Ctrl+Shift+P or Ctrl+Shift+Tab
		 32 Move to previous terminal within the same tab, use Ctrl+PageUp to move to the previous tab. If cycle_term_tab is False, cycle within the same tab will be disabled          //Crtl+Shift+Tab 移动到之前的一个终端
		 33 
		 34 Alt+Up
		 35 Move to the terminal above the current one.    //移动到上面的终端
		 36 
		 37 Alt+Down
		 38 Move to the terminal below the current one.    //移动到下面的终端
		 39 
		 40 Alt+Left
		 41 Move to the terminal left of the current one.    //移动到左边的终端
		 42 
		 43 Alt+Right
		 44 Move to the terminal right of the current one.    //移动到右边的终端
		 45 
		 46 Ctrl+Shift+C
		 47 Copy selected text to clipboard            //复制选中的内容到剪贴板
		 48 
		 49 Ctrl+Shift+V
		 50 Paste clipboard text                //粘贴剪贴板的内容到此处
		 51 
		 52 Ctrl+Shift+W
		 53 Close the current terminal.            //关闭当前终端
		 54 
		 55 Ctrl+Shift+Q
		 56 Quits Terminator                //退出当前窗口，当前窗口的所有终端都将被关闭
		 57 
		 58 Ctrl+Shift+X
		 59 Toggle between showing all terminals and only showing the current one (maximise).    //只显示当前终端和显示所有终端的转换开关
		 60 
		 61 Ctrl+Shift+Z
		 62 Toggle between showing all terminals and only showing a  version of the current one (zoom).    //与Crtl+Shift+X的功能基本一样，只是转换后的当前终端文字等大小不一样
		 63 
		 64 //第二部份：有关各个标签之间的操作
		 65 Ctrl+Shift+T    
		 66 Open new tab    //打开一个新的标签
		 67 
		 68 Ctrl+PageDown    
		 69 Move to next Tab    //移动到下一个标签
		 70 
		 71 Ctrl+PageUp
		 72 Move to previous Tab    //移动到上一个标签
		 73 
		 74 Ctrl+Shift+PageDown
		 75 Swap tab position with next Tab       //没懂这个
		 76 
		 77 Ctrl+Shift+PageUp
		 78 Swap tab position with previous Tab    //没懂这个
		 79 
		 80 Ctrl+Plus (+)
		 81 Increase font size. Note: this may require you to press shift, depending on your keyboard    //增大字体
		 82 
		 83 Ctrl+Minus (-)
		 84 Decrease font size. Note: this may require you to press shift, depending on your keyboard    //减小字体
		 85 
		 86 Ctrl+Zero (0)
		 87 Restore font size to original setting.        //恢复字体到原始大小
		 88 
		 89 F11
		 90 Toggle fullscreen    //全屏开关
		 91 
		 92 Ctrl+Shift+R
		 93 Reset terminal state    //重置终端状态（未懂）
		 94 
		 95 Ctrl+Shift+G
		 96 Reset terminal state and clear window    //重置终端状态并clear屏幕
		 97 
		 98 Super+g
		 99 Group all terminals so that any input sent to one of them, goes to all of them.       //绑定所有的终端，以便向一个输入能够输入到所有的终端
		100 
		101 Super+Shift+G
		102 Remove grouping from all terminals.    //解除绑定
		103 
		104 Super+t
		105 Group all terminals in the current tab so input sent to one of them, goes to all terminals in the current tab.    //绑定当前标签的所有终端
		106 
		107 Super+Shift+T
		108 Remove grouping from all terminals in the current tab.    //解除绑定
		109 
		110 Ctrl+Shift+I
		111 Open a new window (note: unlike in previous releases, this window is part of the same Terminator process)    //打开一个窗口，但是有点像继承了父窗口
		112 
		113 Super+i
		114 Spawn a new Terminator process    //这个跟上一个的主要区别还没弄懂
		115 
		116  
		117 Drag and Drop
		118 The layout can be modified by moving terminals with Drag and Drop. To start dragging a terminal, click and hold on its titlebar. Alternatively, 　　hold down Ctrl, click and hold the right mouse button. Then, **Release Ctrl**. You can now drag the terminal to the point in the layout you wou　　 ld like it to be. The zone where the terminal would be inserted will be highlighted.    //用来改变窗口布局的，另外我觉得这儿是鼠标左键
		
		
		
