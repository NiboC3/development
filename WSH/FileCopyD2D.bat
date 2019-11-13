@echo off
rem ------------------------------------------------
rem Copyright (c) 2019 da-machi
rem This software is released under the MIT License.
rem http://opensource.org/licenses/mit-license.php
rem ------------------------------------------------

rem ------------------------------------------------
rem 機能概要：ファイルの存在を確認後コピーする
rem 第一引数：コピー元ディレクトリ
rem 第二引数：コピー先ディレクトリ
rem ------------------------------------------------

rem 一時的な表示の変更
set prompt=$g

rem 遅延環境変数の展開
setlocal enabledelayedexpansion

set fromPath=%1
set toPath=%2

rem ディレクトリチェック開始
set logMsg1="Directory existence check"
rem ディレクトリ存在する
set logMsg2="Directory exists"
rem コピーが成功しました
set logMsg3="Copy succeeded"
rem コピー開始
set logMsg4="Start copying ..."
rem ディレクトリ存在しない
set errMsg1="Directory does not exist"
rem コピーが失敗しました
set errMsg2="Copy failed"

rem -------------------------------------
rem ファイルの存在チェック
echo %logMsg1:~1,-1%
echo.

dir %fromPath% > nul
rem dirコマンド正常終了でない時
IF !ERRORLEVEL! neq 0 (
	echo %errMsg1:~1,-1%[%fromPath%]
	goto err
) else (
	echo %logMsg2:~1,-1%[%fromPath%]
)

dir %toPath% > nul
rem dirコマンド正常終了でない時
IF !ERRORLEVEL! neq 0 (
	echo %errMsg1:~1,-1%[%toPath%]
	goto err
) else (
	echo %logMsg2:~1,-1%[%toPath%]
)
rem -------------------------------------
rem コピー処理

echo.
echo %logMsg4:~1,-1%
echo [%fromPath%^>^>^>%toPath%]
echo.

rem コピー処理(/E:ディレクトリごとコピー(空ディレクトリでもコピー) /Y:上書きを確認しない)
xcopy /E /Y %fromPath% %toPath% > nul

IF !ERRORLEVEL! neq 0 (
	echo %errMsg2:~1,-1%
	goto err
) else (
	echo %logMsg3:~1,-1%
)

rem -------------------------------------

echo sucsess
pause

rem 正常終了時0返却
exit /b 0

rem エラー時処理ブロック
:err
rem 異常終了時1返却

echo error
pause
exit /b 1
