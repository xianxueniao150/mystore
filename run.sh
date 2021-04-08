docker-compose rm -f
docker image rm -f mystore_apiserver
docker image rm -f mystore_dataserver

cd apiServer/
go build apiServer.go

cd ../dataServer/
go build dataServer.go

docker-compose up 