docker-compose rm -f
docker image rm -f $(docker image ls -q mystore*)

cd apiServer/
go build apiServer.go

cd ../dataServer/
go build dataServer.go

docker-compose up 