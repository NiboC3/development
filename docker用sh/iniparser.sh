#!/bin/bash

#===========================================================================
# Contents   : Parts
#              ini(File) reader
# Arguments  :1)inifile full path
# Author     : da-machi
# LastUpdate : 2019/09/08
# Since      : 2019/09/08
# Problem    : 重複変数は後出し？上書きされるはず
#===========================================================================

#ファイル名(ini)
v_ini_fn=$1

#ループしながらファイル内を1行ずつ処理する。
while read line
do

  #空行か判定(結果出力は捨てる /dev/null)
  echo "${line}" | grep "^\s*$" > /dev/null
  ret0=$?;

  #コメントか判定
  echo "${line}" | grep "^;" > /dev/null
  ret1=$?

  #セクションか確認
  echo "${line}" | grep \\[.*\\] > /dev/null
  ret2=$?

  #空行 コメントの場合は読み飛ばす
  if [ ${ret0} -eq 0 -o ${ret1} -eq 0 ]; then
    #処理なし
    :

  #セクションの場合内容を退避する
  elif [ ${ret2} -eq 0 ]; then
    #セクション内容を退避
    section=`echo ${line} | cut -b 2-$((${#line}-2))`

  #それ以外の行(XXX:YYYみたいな行のはず)
  else
    #セクションが空でないか確認
    test -z ${section};
    ret4=$?;
    #セクションが空ではない
    #1行目がセクションから始まってないときの読み飛ばし
    if [ ${ret4} -ne 0 ]; then
      #文字列結合と文字置換( : -> = )「セクション_構成要素=内容」
      var=`echo ${section}_${line} | sed -e 's/:/=/g'`
      #標準出力
      echo ${var}
    fi
  fi

done < ${v_ini_fn}

