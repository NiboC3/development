#!/bin/bash

#===========================================================================
# Contents   : �e�X�g�p
#              ���s�ƃ��O�o��
# Author     : da-machi
# LastUpdate : 2019/09/08
# Since      : 2019/09/08
#===========================================================================

#�ݒ�t�@�C���i�[��
v_cnf_path=/lint

#�J�����g�f�B���N�g���p�X
v_cur_path=`pwd`
#���O�t�@�C���p�X
v_log=/logs.sh
#��荞�ݕϐ��W�J�iini�t�@�C���j
v_ini_tmp="`./iniparser.sh ${v_cnf_path}`"
eval "${v_ini_tmp}"

#���ʏo�̓t�@�C��
v_out_file=${v_cnf_path}/resurtfile

echo "${test1}"
echo "${test2}"
echo "${test3}"
echo "${test4}"

#�J�n���O�o�́imsg�͎g���܂킵�j
v_msg="script start "
echo `${v_cur_path}${v_log} "${v_msg}"` > ${v_out_file}

#lint�����J�n
v_msg="lint processing start "
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}

echo proc >> resurtfile
echo ${v_cur_path} >> ${v_out_file}

resurt=sucsess!!

#lint�����I��
v_msg="lint processing finish "
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}

#lint�������ʏo��
v_msg=resurt:${resurt}
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}

#�I�����O
v_msg="script finish"
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}


