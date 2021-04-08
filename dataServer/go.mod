module dataServer

require (
	github.com/streadway/amqp v1.0.0 // indirect
	utils v0.0.0
)

replace utils => ../utils

go 1.16
