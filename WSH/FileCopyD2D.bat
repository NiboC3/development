@echo off
rem ------------------------------------------------
rem Copyright (c) 2019 da-machi
rem This software is released under the MIT License.
rem http://opensource.org/licenses/mit-license.php
rem ------------------------------------------------

rem ------------------------------------------------
rem �@�\�T�v�F�t�@�C���̑��݂��m�F��R�s�[����
rem �������F�R�s�[���f�B���N�g��
rem �������F�R�s�[��f�B���N�g��
rem ------------------------------------------------

rem �ꎞ�I�ȕ\���̕ύX
set prompt=$g

rem �x�����ϐ��̓W�J
setlocal enabledelayedexpansion

set fromPath=%1
set toPath=%2

rem �f�B���N�g���`�F�b�N�J�n
set logMsg1="Directory existence check"
rem �f�B���N�g�����݂���
set logMsg2="Directory exists"
rem �R�s�[���������܂���
set logMsg3="Copy succeeded"
rem �R�s�[�J�n
set logMsg4="Start copying ..."
rem �f�B���N�g�����݂��Ȃ�
set errMsg1="Directory does not exist"
rem �R�s�[�����s���܂���
set errMsg2="Copy failed"

rem -------------------------------------
rem �t�@�C���̑��݃`�F�b�N
echo %logMsg1:~1,-1%
echo.

dir %fromPath% > nul
rem dir�R�}���h����I���łȂ���
IF !ERRORLEVEL! neq 0 (
	echo %errMsg1:~1,-1%[%fromPath%]
	goto err
) else (
	echo %logMsg2:~1,-1%[%fromPath%]
)

dir %toPath% > nul
rem dir�R�}���h����I���łȂ���
IF !ERRORLEVEL! neq 0 (
	echo %errMsg1:~1,-1%[%toPath%]
	goto err
) else (
	echo %logMsg2:~1,-1%[%toPath%]
)
rem -------------------------------------
rem �R�s�[����

echo.
echo %logMsg4:~1,-1%
echo [%fromPath%^>^>^>%toPath%]
echo.

rem �R�s�[����(/E:�f�B���N�g�����ƃR�s�[(��f�B���N�g���ł��R�s�[) /Y:�㏑�����m�F���Ȃ�)
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

rem ����I����0�ԋp
exit /b 0

rem �G���[�������u���b�N
:err
rem �ُ�I����1�ԋp

echo error
pause
exit /b 1
