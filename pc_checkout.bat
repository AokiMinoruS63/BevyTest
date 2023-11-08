@echo off

rem `Cargo.toml` をPC向けに書き換える
copy platform_setting\PcCargo.toml Cargo.toml

rem `lib.rs`を`main.rs`にリネーム
move src\lib.rs src\main.rs

echo PC environment is set up.
