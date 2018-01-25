@echo off & color 0A

set "SRC_DIR=%cd%"
echo current path: %SRC_DIR%

set "EXE_DIR=..\..\bin"
echo execute path: %EXE_DIR%

set "OUT_DIR=."
echo output path: %OUT_DIR%

%EXE_DIR%\protoc -I=%SRC_DIR% --cpp_out=%OUT_DIR% %SRC_DIR%\*.proto