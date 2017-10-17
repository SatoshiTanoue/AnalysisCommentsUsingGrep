#実行方法
#sh converter ディレクトリ名

for file in $1/*.cpp; do
    fileName=${file##*/}
    iconv -f SJIS -t UTF8 $file > UTF8/${fileName%.*}-u.cpp
done

for file in $1/*.h; do
    fileName=${file##*/}
    iconv -f SJIS -t UTF8 $file > UTF8/${fileName%.*}-u.h
done
