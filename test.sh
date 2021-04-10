set -x;
# <<COMMENT
curl 127.0.0.1:9200/metadata -H "Content-Type: application/json" -XPUT -d"$(cat elk.json)"

# # echo -n "this is a test" | openssl dgst -sha256 -binary | base64
curl -v 127.0.0.1:12445/objects/test -XPUT -d "this is a test" -H "Digest: SHA-256=Lpl1hUiXKo6IIq1H+hAX/3Lwbz/2oBaFH0XDmHMrxQw="

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
# COMMENT