## Ubuntu 上安装画流程图工具Dia

1.安装


	apt-get install dia-common


2.运行

	dia
		
3.修改支持中文

	sudo vim /usr/bin/dia

将其中内容修改成下面所示：

	dia-normal  "$@"

这样就可以支持中文输入了。
	