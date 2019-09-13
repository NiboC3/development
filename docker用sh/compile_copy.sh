#!/bin/sh

#�ݒ�t�@�C���i�[��
v_cnf_path=`pwd`/lintset.ini
#��荞�ݕϐ��W�J�iini�t�@�C���j
v_ini_tmp="`./iniparser.sh ${v_cnf_path}`"
eval "${v_ini_tmp}"

#���̍폜�͂���܂�悭�Ȃ�
rm -rf ${gitinfo_RepoName}/
rm -rf ${ReView_CreateFile}

ls -l

git clone ${gitinfo_RepoURL}

docker run --rm -v $PWD:/work kauplan/review2.5 /bin/bash -c "cd /work; rake pdf"
docker run --rm -v /root/Private/TechBook7_2019_in_summer/mybook:/work kauplan/review2.5 /bin/bash -c "cd /work; rake pdf"

cp /root/${gitinfo_RepoName}${gitinfo_FilePath}/${ReView_CreateFile} ${ReView_CreateFile}


