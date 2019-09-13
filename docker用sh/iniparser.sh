#!/bin/bash

#===========================================================================
# Contents   : Parts
#              ini(File) reader
# Arguments  :1)inifile full path
# Author     : da-machi
# LastUpdate : 2019/09/08
# Since      : 2019/09/08
# Problem    : �d���ϐ��͌�o���H�㏑�������͂�
#===========================================================================

#�t�@�C����(ini)
v_ini_fn=$1

#���[�v���Ȃ���t�@�C������1�s����������B
while read line
do

  #��s������(���ʏo�͎͂̂Ă� /dev/null)
  echo "${line}" | grep "^\s*$" > /dev/null
  ret0=$?;

  #�R�����g������
  echo "${line}" | grep "^;" > /dev/null
  ret1=$?

  #�Z�N�V�������m�F
  echo "${line}" | grep \\[.*\\] > /dev/null
  ret2=$?

  #��s �R�����g�̏ꍇ�͓ǂݔ�΂�
  if [ ${ret0} -eq 0 -o ${ret1} -eq 0 ]; then
    #�����Ȃ�
    :

  #�Z�N�V�����̏ꍇ���e��ޔ�����
  elif [ ${ret2} -eq 0 ]; then
    #�Z�N�V�������e��ޔ�
    section=`echo ${line} | cut -b 2-$((${#line}-2))`

  #����ȊO�̍s(XXX:YYY�݂����ȍs�̂͂�)
  else
    #�Z�N�V��������łȂ����m�F
    test -z ${section};
    ret4=$?;
    #�Z�N�V��������ł͂Ȃ�
    #1�s�ڂ��Z�N�V��������n�܂��ĂȂ��Ƃ��̓ǂݔ�΂�
    if [ ${ret4} -ne 0 ]; then
      #�����񌋍��ƕ����u��( : -> = )�u�Z�N�V����_�\���v�f=���e�v
      var=`echo ${section}_${line} | sed -e 's/:/=/g'`
      #�W���o��
      echo ${var}
    fi
  fi

done < ${v_ini_fn}

