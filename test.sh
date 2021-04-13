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

dd if=/dev/urandom of=/tmp/file bs=1000 count=100
dd if=/tmp/file of=/tmp/first bs=1000 count=50
dd if=/tmp/file of=/tmp/second bs=1000 skip=32 count=68

openssl dgst -sha256 -binary /tmp/file | base64


curl -v 127.0.0.1:12445/objects/test -XPOST  \
    -H "Digest: SHA-256=RxO59yTR1JyI3RK2FTKwM7kcBeWDkh4TfXXe6bANifM=" -H "Size: 100000"

curl -I 127.0.0.1:12445/temp/eyJOYW1lIjoidGVzdCIsIlNpemUiOjEwMDAwMCwiSGFzaCI6IlJ4TzU5eVRSMUp5STNSSzJGVEt3TTdrY0JlV0RraDRUZlhYZTZiQU5pZk09IiwiU2VydmVycyI6WyJkYXRhc2VydmVyNDoxMjM0NSIsImRhdGFzZXJ2ZXI6MTIzNDUiLCJkYXRhc2VydmVyMjoxMjM0NSIsImRhdGFzZXJ2ZXI2OjEyMzQ1IiwiZGF0YXNlcnZlcjU6MTIzNDUiLCJkYXRhc2VydmVyMzoxMjM0NSJdLCJVdWlkcyI6WyJlNTRmMDc2YS0xMGI4LTQ3M2UtOWU1MS0xYjYxOTI1YjBkYTAiLCIwNWIyYjc5Yi01N2ZkLTQyNjUtOTEyMC0xZmVkYTdhMzg0ZWMiLCI1ZjA5Mjc5Mi02NDMxLTQxOGMtOTUyYi1mMTY0MDdkMGEyZmMiLCIxYTJjODVjZC03Mzk1LTQxM2UtYTVhNC1jNGVlZGE3NTFiNjEiLCI5OTM1YjQwYS1hYmE5LTQ1NzQtOWQwNS0yZTAyMmI1OGVkZTIiLCIxMWVmNmZlMC01M2IwLTQ0MmMtOTIwZi00N2NhNmUyZTM2ZDAiXX0=

curl -v -XPUT --data-binary @/tmp/first 127.0.0.1:12445/temp/eyJOYW1lIjoidGVzdCIsIlNpemUiOjEwMDAwMCwiSGFzaCI6IlJ4TzU5eVRSMUp5STNSSzJGVEt3TTdrY0JlV0RraDRUZlhYZTZiQU5pZk09IiwiU2VydmVycyI6WyJkYXRhc2VydmVyNDoxMjM0NSIsImRhdGFzZXJ2ZXI6MTIzNDUiLCJkYXRhc2VydmVyMjoxMjM0NSIsImRhdGFzZXJ2ZXI2OjEyMzQ1IiwiZGF0YXNlcnZlcjU6MTIzNDUiLCJkYXRhc2VydmVyMzoxMjM0NSJdLCJVdWlkcyI6WyJlNTRmMDc2YS0xMGI4LTQ3M2UtOWU1MS0xYjYxOTI1YjBkYTAiLCIwNWIyYjc5Yi01N2ZkLTQyNjUtOTEyMC0xZmVkYTdhMzg0ZWMiLCI1ZjA5Mjc5Mi02NDMxLTQxOGMtOTUyYi1mMTY0MDdkMGEyZmMiLCIxYTJjODVjZC03Mzk1LTQxM2UtYTVhNC1jNGVlZGE3NTFiNjEiLCI5OTM1YjQwYS1hYmE5LTQ1NzQtOWQwNS0yZTAyMmI1OGVkZTIiLCIxMWVmNmZlMC01M2IwLTQ0MmMtOTIwZi00N2NhNmUyZTM2ZDAiXX0=
curl -v -XPUT --data-binary @/tmp/second -H "range: bytes=32000-" 127.0.0.1:12445/temp/eyJOYW1lIjoidGVzdCIsIlNpemUiOjEwMDAwMCwiSGFzaCI6IlJ4TzU5eVRSMUp5STNSSzJGVEt3TTdrY0JlV0RraDRUZlhYZTZiQU5pZk09IiwiU2VydmVycyI6WyJkYXRhc2VydmVyNDoxMjM0NSIsImRhdGFzZXJ2ZXI6MTIzNDUiLCJkYXRhc2VydmVyMjoxMjM0NSIsImRhdGFzZXJ2ZXI2OjEyMzQ1IiwiZGF0YXNlcnZlcjU6MTIzNDUiLCJkYXRhc2VydmVyMzoxMjM0NSJdLCJVdWlkcyI6WyJlNTRmMDc2YS0xMGI4LTQ3M2UtOWU1MS0xYjYxOTI1YjBkYTAiLCIwNWIyYjc5Yi01N2ZkLTQyNjUtOTEyMC0xZmVkYTdhMzg0ZWMiLCI1ZjA5Mjc5Mi02NDMxLTQxOGMtOTUyYi1mMTY0MDdkMGEyZmMiLCIxYTJjODVjZC03Mzk1LTQxM2UtYTVhNC1jNGVlZGE3NTFiNjEiLCI5OTM1YjQwYS1hYmE5LTQ1NzQtOWQwNS0yZTAyMmI1OGVkZTIiLCIxMWVmNmZlMC01M2IwLTQ0MmMtOTIwZi00N2NhNmUyZTM2ZDAiXX0=
# COMMENT


# chap7
dd if=/dev/zero of=/tmp/file bs=1M count=100

openssl dgst -sha256 -binary /tmp/file | base64

curl -v -XPUT --data-binary @/tmp/file 127.0.0.1:12445/objects/test  \
    -H "Digest: SHA-256=IEkqTQ2E+L6xdn9mFiKfhdRMKCe2S9v7Jg7hL6EQng4="


curl -v  127.0.0.1:12445/objects/test  \
    -H "Accept-Encoding: gzip" -o /tmp/output.gz

gzip -d output.gz