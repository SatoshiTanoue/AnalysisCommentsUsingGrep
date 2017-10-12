#!/bin/sh
# ファイルを1行ずつ読み込んで表示

PATERNFILE=./pattern.txt
while read line; do
    ggrep -n -i -P --color=always "${line}" $1 && echo "'$line'がマッチしました"
done < $PATERNFILE
