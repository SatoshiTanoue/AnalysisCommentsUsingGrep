#!/bin/bash
#使用方法 : sh multiple_check.sh ディレクトリ名
#sh multiple_check.sh ../../../testcode

#関数の利用 http://shellscript.sunone.me/function.html
PATERNFILE=./pattern.txt
AnayazeCommentsWithColor(){
    for file in *.c; do
        echo "${file}"
        while read line; do
            grep -n -i -P --color=always "${line}" $file && echo "'$line'がマッチしました"
        done < $PATERNFILE
    done
}
AnayazeComments(){
    date
    while read line; do
        grep -n -i -P "${line}" $1 && echo "'$line'がマッチしました"
    done < $PATERNFILE
}
#cppファイルに対して実行
for file in $1/*.cpp; do
    fileName=${file##*/}
    AnayazeComments $file > result/${fileName}.txt 
done

#cppファイル名に対して
for file in $1/*.h; do
    fileName=${file##*/}
    AnayazeComments $file > result/${fileName}.txt 
done
