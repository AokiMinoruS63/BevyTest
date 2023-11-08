#!/bin/bash

# `Cargo.toml` をモバイル向けに置き換える
cp platform_setting/MobileCargo.toml Cargo.toml

# `main.rs``lib.rs`にリネーム
mv src/main.rs src/lib.rs

echo "Mobile environment is set up."
