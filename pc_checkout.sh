#!/bin/bash

# `Cargo.toml` をPC向けに書き換える
cat > Cargo.toml <<EOL
[package]
name = "bevy_pc_example"
version = "0.1.0"
edition = "2021"
description = "Example for building a PC app with Bevy"
publish = false
license = "MIT OR Apache-2.0"

# PC向けの依存関係を追加
[dependencies]
bevy = "0.12.0"
EOL

# `main.rs`をコピーし、`lib.rs`を削除
if [ ! -f src/main.rs ]; then
    cp template/main.rs src/main.rs
    rm src/lib.rs
fi

echo "PC environment is set up."
