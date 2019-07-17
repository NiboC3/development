# Development storage area  

## Dockerfile置き場  

実行時コマンド置き場

### build
`docker image build -f ./dockerfileの場所 -t イメージ名:タグ .`  

### run
`docker run --privileged -p XXX:YYY --name コンテナ名称 -d イメージ名:タグ /sbin/init`  

### コンテナログイン
`docker exec -ti test bash`  

  
###### developer:da-machi  