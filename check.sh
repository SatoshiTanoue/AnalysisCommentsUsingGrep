#!/bin/bash
#使用例 : sh check.sh code_comment_sample_20161108.c

PATERNFILE=./pattern.txt
AnayazeCommentsWithColor(){
while read line; do
    grep -n -i -P --color=always "${line}" $1 && echo "'$line'がマッチしました"
done < $PATERNFILE
}

AnayazeComments(){
date
while read line; do
    grep -n -i -P "${line}" $1 && echo "'$line'がマッチしました"
done < $PATERNFILE
}

#関数の利用 http://shellscript.sunone.me/function.html
AnayazeCommentsWithColor $1
#拡張子の削除 https://qiita.com/koara-local/items/04d3efd1031ea62d8db5
AnayazeComments $1 > result/${1%.*}.txt 
