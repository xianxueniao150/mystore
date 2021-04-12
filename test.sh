set -x;
set -e;

curl 127.0.0.1:9200/metadata -H "Content-Type: application/json" -XPUT -d"$(cat elk.json)" && echo  ""

# # echo -n "this is a test" | openssl dgst -sha256 -binary | base64
curl -v 127.0.0.1:12445/objects/test -XPUT -d "this is a test" -H "Digest: SHA-256=Lpl1hUiXKo6IIq1H+hAX/3Lwbz/2oBaFH0XDmHMrxQw="

curl 127.0.0.1:12446/objects/test -v

<<COMMENT
# # echo -n "this is a test version2" | openssl dgst -sha256 -binary | base64
curl -v 127.0.0.1:12445/objects/test -XPUT -d "this is a test version2" -H "Digest: SHA-256=yaoT0Ly+OjoKS0A723M4vJy1phShm6/bMHY3L7m1Plg="

curl -v 127.0.0.1:12445/objects/test2 -XPUT -d "this is a test version2" -H "Digest: SHA-256=yaoT0Ly+OjoKS0A723M4vJy1phShm6/bMHY3L7m1Plg="
# COMMENT

# <<COMMENT
curl 127.0.0.1:12445/locate/Lpl1hUiXKo6IIq1H+hAX%2F3Lwbz%2F2oBaFH0XDmHMrxQw= 


curl 127.0.0.1:12446/locate/yaoT0Ly+OjoKS0A723M4vJy1phShm6%2FbMHY3L7m1Plg=
echo  -e "\n"
curl 127.0.0.1:12446/versions/test
echo  ""
curl 127.0.0.1:12446/objects/test?version=1
echo  ""
curl 127.0.0.1:12446/objects/test

echo  ""
curl 127.0.0.1:12445/objects/test -XDELETE

echo  ""
curl 127.0.0.1:12446/objects/test -v

echo  ""
curl 127.0.0.1:12446/versions/test

echo  ""
curl 127.0.0.1:12446/objects/test?version=2 -v



docker exec  mystore_dataserver_1 ls /store/temp
docker exec  mystore_dataserver_1 ls /store/objects

docker exec  mystore_dataserver3_1 ls /store/temp
docker exec  mystore_dataserver3_1 ls /store/objects
docker exec  mystore_dataserver3_1 rm /store/objects/Lpl1hUiXKo6IIq1H+hAX%2F3Lwbz%2F2oBaFH0XDmHMrxQw=.0.HreWAkEe8Cz2%2FhF4lwFf%2F4n4D6zk7M1QQlxFFJsUhAg=

docker exec  mystore_dataserver4_1 ls /store/objects
docker exec  mystore_dataserver3_1 echo garbage > /store/objects/Lpl1hUiXKo6IIq1H+hAX%2F3Lwbz%2F2oBaFH0XDmHMrxQw=.0.HreWAkEe8Cz2%2FhF4lwFf%2F4n4D6zk7M1QQlxFFJsUhAg=

docker exec  mystore_dataserver4_1 echo garbage >  /store/objects/Lpl1hUiXKo6IIq1H+hAX%2F3Lwbz%2F2oBaFH0XDmHMrxQw=.5.B9zkhqiK
bash: /store/objects/Lpl1hUiXKo6IIq1H+hAX%2F3Lwbz%2F2oBaFH0XDmHMrxQw=.5.B9zkhqiKSD4hXw0d4M4S8El6VlSiJm6vdCYEVvBjvDo=: No such file or directory

# COMMENT