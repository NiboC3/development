#!/bin/bash

#===========================================================================
# Contents   : テスト用
#              実行とログ出力
# Author     : da-machi
# LastUpdate : 2019/09/08
# Since      : 2019/09/08
#===========================================================================

#設定ファイル格納先
v_cnf_path=/lint

#カレントディレクトリパス
v_cur_path=`pwd`
#ログファイルパス
v_log=/logs.sh
#取り込み変数展開（iniファイル）
v_ini_tmp="`./iniparser.sh ${v_cnf_path}`"
eval "${v_ini_tmp}"

#結果出力ファイル
v_out_file=${v_cnf_path}/resurtfile

echo "${test1}"
echo "${test2}"
echo "${test3}"
echo "${test4}"

#開始ログ出力（msgは使いまわし）
v_msg="script start "
echo `${v_cur_path}${v_log} "${v_msg}"` > ${v_out_file}

#lint処理開始
v_msg="lint processing start "
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}

echo proc >> resurtfile
echo ${v_cur_path} >> ${v_out_file}

resurt=sucsess!!

#lint処理終了
v_msg="lint processing finish "
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}

#lint処理結果出力
v_msg=resurt:${resurt}
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}

#終了ログ
v_msg="script finish"
echo `${v_cur_path}${v_log} "${v_msg}"` >> ${v_out_file}


