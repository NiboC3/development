#!/bin/bash

#===========================================================================
# Contents   : Parts
# Processing : ini�t�@�C���̓ǂݍ��݂ƕϐ��̕W���o��
# Arguments  : 1)ini�t�@�C���ւ̃t���p�X�i�t�@�C�������j
# Author     : da-machi
# LastUpdate : 2019/09/14
# Since      : 2019/09/08
# Problem    : �d���ϐ��͏㏑�������i�d�l�j
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
      #�����񌋍��ƕ����u��( \r -> )�u�Z�N�V����_�\���v�f=���e�v
      var=`echo ${section}_${line} | sed -e 's/\r//g'`
      #�W���o��
      echo ${var}
    fi
  fi

done < ${v_ini_fn}

