//未定である．
class Test {
public:
    // TODO 内部処理を記述する
    Test();
    /**
     * テスト番号を取得する。
     * 内部処理は将来本実装する。
     */
    int GetTestNumber();
    // テスト番号を設定する。
    void SetTestNumber(int testNumber);
private:
    // 2016/11/08 修正
    //int m_testNumber = 0;
    int m_testNumber = 1;
};
int Test::GetTestNumber() {
    for (int i = 0; i < 10; i++) { // ループ )
    }
    return m_testNumber;
};
void Test::SetTestNumber(int testNumber) {
    if (testNumber > 0) {
	m_testNumber = testNumber;
    }
    // elseのパターンはなくて大丈夫？ 
};
