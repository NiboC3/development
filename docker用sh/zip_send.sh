#!/bin/sh

#設定ファイル格納先
v_cnf_path=`pwd`/lintset.ini
#取り込み変数展開（iniファイル）
v_ini_tmp="`./iniparser.sh ${v_cnf_path}`"
eval "${v_ini_tmp}"

zip pdf.zip ${ReView_CreateFile}
curl -F file=@pdf.zip -F channels=${slackinfo_Channels} -F token=${slackinfo_OAuthToken} https://slack.com/api/files.upload


