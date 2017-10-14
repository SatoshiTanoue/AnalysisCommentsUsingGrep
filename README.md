# 動作に必要なもの
GNU Grep， bashの動く環境(bush on ubuntu on Windows)  
bush on ubuntu on Windows　だとすぐに動く．
```
git clone https://github.com/SatoshiTanoue/AnalysisCommentsUsingGrep.git
$ cd AnalysisCommentsUsingGrep
```
# grepによる特定のコメントを検出

pattern.txtに文字列検出のパターンを記述する．

単体ファイルに対して実行
```
$ sh 755 check.sh #一度だけ
$ sh check.sh code_comment_sample.cpp #ファイルパス．
4:    // TODO 内部処理を記述する
'TODO'がマッチしました
8:     * 内部処理は将来本実装する。
'将来'がマッチしました
19:    for (int i = 0; i < 10; i++) { // ループ )
'ループ'がマッチしました
14:    // 2016/11/08 修正
'(?=.*\d{2,4}[.\-/年]\d{1,2}[.\-/月]\d{1,2}日{0,1})(?=.*修正)'がマッチしました
1://未定である．
'^(?!.*未定義).*(?=未定).*$'がマッチしました
27:    // elseのパターンはなくて大丈夫？
'？'がマッチしました
```
実行結果はresultディレクトリの中に保存されます．

ディレクトリを指定して実行

```
$sh multiple_check.sh ../../../testcode #ディレクトリ名
```
このとき，ディレクトリ名を../../../testcode/としないでください．
# 注意

・空行があると，全てのパターンにマッチしてしまい全てを表示してしまう．  
・pattern.txtの文字コードはutf-8になっているため，Shift-Jisに変更する必要があるかも知れない．  
・pattern.txtでは,\dといったメタ文字を使う場合には\\dとする必要がある．
・pattern.txtのパターンファイルを別のパターンに変更するには，check.shを開いて，パターンファイルの名前を変更する． 
・ファイルによっては，先読みの正規表現が動かないかもしれない．  

# grepとの比較
?は，三項演算子として使われる．そのため，?を含むコードの場合は，適合率が下がる．  
グループ分けできない？ 何をする正規表現かコメントを記述できない．  
