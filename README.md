# Windows, iOS, Web, Android, iPhoneのクロスプラットフォーム環境が構築について
Windows, iOS, Web, Android, iPhoneのクロスプラットフォーム環境が構築出来たので共有します。

- [Windows, iOS, Web, Android, iPhoneのクロスプラットフォーム環境が構築について](#windows-ios-web-android-iphoneのクロスプラットフォーム環境が構築について)
 - [Rustのインストール・プロジェクトの作成](#rustのインストールプロジェクトの作成)
 - [iOS](#ios)
   - [前提条件](#前提条件)
   - [実行](#実行)
 - [Android](#android)
   - [前提条件](#前提条件-1)
   - [実行](#実行-1)
 - [Windows](#windows)
   - [前提条件](#前提条件-2)
   - [実行](#実行-2)
 - [Mac](#mac)
   - [前提条件](#前提条件-3)
   - [実行](#実行-3)
 - [WASM](#wasm)
   - [前提条件](#前提条件-4)
   - [実行](#実行-4)
 - [参考資料](#参考資料)
 - [課題](#課題)


## Rustのインストール・プロジェクトの作成
1. `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`でダウンロード・インストール実行
2. インストール設定は基本的にデフォルトで進めますが、`Profile`設定のみ`default`ではなく`complete`にしてください。これは、wasmがインストールされないためです。
3. `cargo --version`でインストール及び環境パスが設定されていることを確認します。
4. `https://github.com/AokiMinoruS63/BevyTest.git`からclone
5. ここをカレントディレクトリとします

## iOS
### 前提条件
1. `rustup target add aarch64-apple-ios x86_64-apple-ios aarch64-apple-ios-sim` を初回のみ実行
### 実行
1. `sh mobile_checkout.sh`
2. `make run`またはXCodeプロジェクトを開いてbuild or run


## Android
### 前提条件
1. `.zsrcファイル`に環境変数追加
NDKのバージョンは23以降のものの指定が必須です
例:
```
export ANDROID_SDK_ROOT="/Users/minoruaoki/Library/Android/sdk"
export ANDROID_NDK_ROOT="$ANDROID_SDK_ROOT/ndk/25.2.9519653"
```
2. `rustup target add aarch64-linux-android armv7-linux-androideabi`
3. `cargo install cargo-apk`

### 実行
1. `sh mobile_checkout.sh`
2. `cargo apk build` or `cargo apk run`

## Windows
### 前提条件
1. この項目のみWindowsで行います
2. Rustの公式ページからインストーラダウンロード・実行
3. `Visual Studio 2019 build tools installer`実行、インストール
4. `rustup target add x86_64-pc-windows-msvc` を初回のみ実行

### 実行
1. `pc_checkout.bat`
2. `cargo run`

## Mac
### 前提条件
1. XCodeをインストールしていなければ,`xcode-select --install` もしくは`Xcode`インストール
2. `rustup target add aarch64-unknown-linux-gnu` を初回のみ実行
### 実行
1. `sh pc_checkout.sh`
2. `cargo run`

## WASM
### 前提条件
1. `rustup target add wasm32-unknown-unknown`
4. `cargo install wasm-server-runner`
### 実行
1. `sh pc_checkout.sh`
2. `cargo run --target wasm32-unknown-unknown`
3. ローカルサーバーに接続

## 参考資料
https://github.com/bevyengine/bevy/tree/main/examples

## 課題
1. リソースが20Mbyte程度なのにAndroidなどバイナリサイズが700Mbyteなど巨大。（releaseバイナリなら少しは減る？）
2. 各種認証やfirebaseなどの実装がまだ
3. MacでもWindowsのexeファイルを作れるかもしれないので試してみるかも
