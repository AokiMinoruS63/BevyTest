#!/bin/bash

# `Cargo.toml` をPC向けに置き換える
cp platform_setting/PcCargo.toml Cargo.toml
# `lib.rs`を`main.rs`にリネーム
mv src/lib.rs src/main.rs

echo "PC environment is set up."
