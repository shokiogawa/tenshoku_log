# フォルダ構成
関連ファイルを追いやすいため、Featureファーストを採用

しかし、pagesはトップレベルで配置し、pagesは、各機能を使用することができる。

## Riverpod
### 参照系
基本的にFutureProviderを使用する。

### 更新系
NotifierProviderを挟み、ローディング処理、エラー処理を委託すること。
※ FutureProviderで更新処理(副作用のある処理)をしないこと。

更新後、以下の2つの方法どちらかを選択し、データを最新の状態に保つこと。
1. 副作用のあるメソッドで返り値を取得し、stateを更新する。
2. 副作用のあるメソッドが成功後、その副作用を与えたデータを保持しているFutureProviderをref.invalidateする。




# ユースケース

### 転職候補企業
- ユーザーは転職候補企業を登録できる。
- ユーザーは転職候補企業を編集できる。
- ユーザーは転職候補企業を削除できる。
- ユーザーは転職候補企業を一覧表示で確認できる。
- ユーザーは、転職候補企業を選考ステータス毎に確認できる。
- ユーザーは、転職候補企業の選考ステータスを変更できる。

### 選考ステータス
- 選考ステータスを追加
- 選考ステータスを編集
- 選考ステータスを削除

### エージェント
- 使用エージェントを作成できる。
- 使用エージェントを編集できる。
- 使用エージェントを削除できる。

# エンティテ

### 転職候補企業 (selection_company)
- ID
- 企業名
- メモ
- 公式URL
- 次回予定日
- 転職エージェントID
- 選考ステータスマスタ (デフォルトは書類選考)

### 選考日 (selection_date)
- ID
- 転職候補企業ID
- 選考ステータスID (デフォルトは書類選考)
- 選考合否マスタID (デフォルトは選考中)
- 選考日

### 選考合否マスタ (selection_result_master)
- ID
- 名前
選考中/結果待ち/合格/お見送り

### 選考ステータスマスタ (selection_status_master)
- ID
- 名前
書類選考/1次面接/2次面接/3次面接/最終面接/採用/お見送り

### エージェント (agent)
- ID
- 名前
- メモ
- URL

### メモ
- ID
- 内容