#!/bin/bash

# `Cargo.toml` をモバイル向けに書き換える
cat > Cargo.toml <<EOL
[package]
name = "bevy_mobile_example"
version = "0.1.0"
edition = "2021"
description = "Example for building an iOS or Android app with Bevy"
publish = false
license = "MIT OR Apache-2.0"

[lib]
name = "bevy_mobile_example"
crate-type = ["staticlib", "cdylib"]

# モバイル向けの依存関係とメタデータを追加
[dependencies]
bevy = "0.12.0"

[package.metadata.android]
# Android特有の設定をここに追加
package = "org.bevyengine.example"
apk_name = "bevyexample"
assets = "assets"
resources = "assets/android-res"
# This strips debug symbols from the shared libraries, drastically reducing APK size. If you need them, remove the option.
strip = "strip"
build_targets = ["aarch64-linux-android", "armv7-linux-androideabi"]

[package.metadata.android.application]
icon = "@mipmap/ic_launcher"
label = "Bevy Example"

[package.metadata.ios]
# iOS特有の設定をここに追加
EOL

# `lib.rs`をコピーし、`main.rs`を削除
cp template/main.rs src/lib.rs
rm src/main.rs

echo "Mobile environment is set up."
