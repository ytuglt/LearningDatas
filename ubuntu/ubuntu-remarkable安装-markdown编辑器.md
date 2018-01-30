# Ubuntu之markdown编辑器-remarkable 安装

## 1.下载
 
[https://remarkableapp.github.io/linux/download.html](https://remarkableapp.github.io/linux/download.html) 

下载.deb安装包

## 2.命令行安装

	sudo dpkg -i remarkable_1.87_all.deb
	
执行这条指令会报错缺少依赖，然后执行下面一条语句：

	sudo apt-get install -f
	
## 3.打开remarkable

	remarkable &
	
执行这条指令能够正常打开说明安装成功了


**注意：**

如果报警说少了 gtkspellcheck：

	sudo apt-get install python3-gtkspellcheck

本次安装没有报警告，则没有执行该指令