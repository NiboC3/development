#!/bin/bash

#===========================================================================
# Contents   : テスト用
#              実行とログ出力
# Author     : da-machi
# LastUpdate : 2019/09/08
# Since      : 2019/09/08
#===========================================================================

#設定ファイル格納先
v_cnf_path=`pwd`/lintset.ini

#カレントディレクトリパス
v_cur_path=`pwd`
#ログファイル
v_log=/logs.sh
#取り込み変数展開（iniファイル）
v_ini_tmp="`./iniparser.sh ${v_cnf_path}`"
eval "${v_ini_tmp}"

#結果出力ファイル
v_out_file=`pwd`/resurtfile

echo "${test_test1}"
echo "${test_test2}"
echo "${test_test3}"
echo "${test_test4}"

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


