# BSLogger
<img src="https://img.shields.io/badge/SPM-v1.0.0-blue.svg?logo=swift" />
<img src="https://img.shields.io/badge/platform-iOS-lightgrey.svg" />
<br><br>

[TOC]

## 概要
[bravesoft](https://www.bravesoft.co.jp/)が提供するシンプルにLog出力が可能なライブラリです。

## インストール方法
このライブラリはSwift Package Manager(以下、SPMとする)を使って導入することが可能です。  

### Swift Package Manager
#### 要件
- Xcode 14.0.0以降が必要です。
- サポートしているプラットフォームとバージョンは、[Package.swift](./Package.swift)を参照してください。
#### インストール
##### Xcodeからインストール
導入したいProjectを選択し、`Package Dependencies`タブの左下にある`+`ボタンを押下します。

![インストール画像1](./Docs/images/install_1.png)

---

右上の検索窓にリポジトリのURLを入力して、`bs_logger`を検索します。
```console
https://gitlab.com/bs-libraries/bs_logger
```
![インストール画像2](./Docs/images/install_2.png)

---

次に`Dependecy Rule`に`Up to Next Manager Version`、最低バージョンに`1.0.0`を指定して、ダイアログ右下の`Add Package`ボタンを押下します。

![インストール画像3](./Docs/images/install_3.png)

---

`BSLogger`を選択したままの状態で`Add Package`ボタンを押下してライブラリをインストールします。

![インストール画像4](./Docs/images/install_4.png)


### ログ出力
ログレベルに応じてメソッドを切り替えて使用してください。
#### ログ出力一覧
|レベル|通常ログ出力|変数ログ出力|
|----|----|----|
|debug|`BSLogger.debug(Any)`|`hoge.log(level: .debug)`|
|info|`BSLogger.info(Any)`|`hoge.log(level: .info)`|
|warn|`BSLogger.warn(Any)`|`hoge.log(level: .warn)`|
|error|`BSLogger.error(Any)`|`hoge.log(level: .error)`|

#### ログ出力サンプル
通常のログ出力のサンプルです。
```swift
import BSLogger

actor MainViewModel: ObservableObject {
    func onTapButton() {
        BSLogger.debug("Button was tapped.")
        BSLogger.debug("Hello, world.", 1)
    }
}
```
出力結果 >
```console
[DEBUG] MainViewModel.onTapButton() #5: Button was tapped.
[DEBUG] MainViewModel.onTapButton() #6: Hello, world
[DEBUG] MainViewModel.onTapButton() #6: 1
```

---

変数を直接ログ出力する場合のサンプルです。
```swift
import BSLogger

actor MainViewModel: ObservableObject {
    func onTapButton() {
        let text = "Button was tapped."

        text.log(level: .warn)
    }
}
```
出力結果 >
```console
[WARN] MainViewModel.onTapButton() #7: Button was tapped.
```

#### 変数ログ出力でサポートされている型一覧
##### プリミティブ型
- String
- Int
- Double
- Float
- Bool
- Dictionary
- Array
- Date
- Error
- Int64
- UInt
- NSDictionary
- NSArray
##### UIKit
- CGFloat
- CGPoint
- CGSize
- CGRect
- CGAffineTransform
- UIEdgeInsets

### 実行速度計測
処理の実行速度を計測したい時に簡単に使えるメソッドを用意しています。

```swift
import BSLogger

BSLogger.timeCheck(key: "Time") {
    Thread.sleep(forTimeInterval: 5.0)
}
```

また最低OSにiOS13以上が指定されているプロジェクトでは`async/await`をサポートしたメソッドが利用可能です。
```swift
import BSLogger

BSLogger.timeCheck(key: "AsyncTime", task: .main) {
    try? await Task.sleep(nanoseconds: 500000)
}
```

### Deinitログ出力
オブジェクト破棄時のメソッドが準備されてます。

```swift
import BSLogger

class Hoge {
    deinit {
        BSLogger.deinit()
    }
}
```
出力結果 >
```console
[DEINIT] Hoge deinit
```

## デモアプリ
[デモアプリ](./Demo)
## ライセンス
※ 社外公開する時に記載。
