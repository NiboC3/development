#!/bin/sh

#�ݒ�t�@�C���i�[��
v_cnf_path=`pwd`/lintset.ini
#��荞�ݕϐ��W�J�iini�t�@�C���j
v_ini_tmp="`./iniparser.sh ${v_cnf_path}`"
eval "${v_ini_tmp}"

zip pdf.zip ${ReView_CreateFile}
curl -F file=@pdf.zip -F channels=${slackinfo_Channels} -F token=${slackinfo_OAuthToken} https://slack.com/api/files.upload


