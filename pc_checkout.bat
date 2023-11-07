@echo off

rem `Cargo.toml` をPC向けに書き換える
type NUL > Cargo.toml
echo [package] >> Cargo.toml
echo name = "bevy_pc_example" >> Cargo.toml
echo version = "0.1.0" >> Cargo.toml
echo edition = "2021" >> Cargo.toml
echo description = "Example for building a PC app with Bevy" >> Cargo.toml
echo publish = false >> Cargo.toml
echo license = "MIT OR Apache-2.0" >> Cargo.toml
echo. >> Cargo.toml

rem PC向けの依存関係を追加
echo [dependencies] >> Cargo.toml
echo bevy = "0.12.0" >> Cargo.toml
echo. >> Cargo.toml

rem wasm向けの依存関係を追加
echo [target.wasm32-unknown-unknown] >> Cargo.toml
echo runner = "wasm-server-runner" >> Cargo.toml

rem `main.rs`をコピーし、`lib.rs`を削除
if not exist src\main.rs (
   copy template\main.rs src\main.rs
   del src\lib.rs
}

echo PC environment is set up.
