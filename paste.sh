#!/data/data/com.termux/files/usr/bin/bash

upload(){

	text=`cat $1`
	link=`curl -X POST -d 'api_dev_key=XnKTnFUIMJb1B4oYb5ViCs7a213pKViZ' -d "api_paste_code=$text" -d 'api_option=paste' "https://pastebin.com/api/api_post.php"` 2> `cd;cd ../usr/etc;pwd`/error.txt
	if [[ $? != 0 ]];then
		exit 1
	else
		echo "$link"
		exit 0
	fi
}

download(){
	out=`curl -o output.txt https://pastebin.com/raw/$1`
	if [[ $? != 0 ]];then
		exit 1
	else
		exit 0
	fi
}

if [[ $1 = "--upload" ]];then
	upload $2
fi

if [[ $1 = "--download" ]];then
	download $2
fi

if [[ $1 = "--help" ]];then
	echo -e "help\033[1;32m:\033[00m
        \033[1;32m.\033[00m/paste\033[1;32m.\033[00msh \033[1;35m--upload\033[00m \033[1;32m<\033[00mfile name\033[1;32m>\033[00m
        \033[1;32m.\033[00m/paste\033[1;32m.\033[00msh \033[1;35m--download\033[00m \033[1;32m<\033[00mid\033[1;32m>\033[00m
        \033[1;32m.\033[00m/paste\033[1;32m.\033[00msh \033[1;35m--help\033[00m
        \033[1;32m.\033[00m/paste\033[1;32m.\033[00msh \033[1;35m--version\033[00m

This script is made by @sagnik628\033[1;32m.\033[00m
This script is used to upload files on pastebin and also download it\033[1;32m.\033[00m
This script use the DEVELOPER API of pastebin to upload file on pastebin\033[1;32m.\033[00m
                                                \033[1;35m--@sagnik628\033[00m"
fi

if [[  $1 = "--version" ]];then
	echo "1.0"
	exit 0
fi

if [[ $1 = "" ]];then
	echo -e "try\033[1;32m:\033[00m
\033[1;32m.\033[00m/paste\033[1;32m.\033[00msh \033[1;35m--help\033[00m"
	exit 1
fi
