#!/bin/sh

#===========================================================================
# Contents   : Parts
# Processing : �t�@�C�������k���M����
# Author     : da-machi
# LastUpdate : 2019/09/14
# Since      : 2019/09/08
# Problem    : �Ȃ��H
#===========================================================================

#�ݒ�t�@�C���i�[��
v_cnf_path=`pwd`/lintset.ini
#��荞�ݕϐ��W�J�iini�t�@�C���j
v_ini_tmp="`./iniparser.sh ${v_cnf_path}`"
eval "${v_ini_tmp}"

zip pdf.zip ${ReView_CreateFile}
curl -F file=@pdf.zip -F channels=${slackinfo_Channels} -F token=${slackinfo_OAuthToken} https://slack.com/api/files.upload


