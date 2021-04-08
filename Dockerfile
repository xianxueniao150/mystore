FROM golang:alpine 

ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64 
    # \
    # STORAGE_ROOT=/tmp/1 \
    # LISTEN_ADDRESS=:12345 \
    # RABBITMQ_SERVER=amqp://test:test@127.0.0.1:5672

WORKDIR /go/src/app

# 将代码复制到容器中
COPY ./dataServer .

# 将我们的代码编译成二进制可执行文件app
RUN go build -o dataServer .

# 声明服务端口
EXPOSE 12345

# 启动容器时运行的命令
CMD ["/go/src/app/dataServer"]