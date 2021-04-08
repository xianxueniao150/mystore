package locate

import (
	"fmt"
	"log"
	"mystore/utils/rabbitmq"
	"os"
	"strconv"
	"time"
)

func Locate(name string) string {
	q := rabbitmq.New(os.Getenv("RABBITMQ_SERVER"))
	q.Publish("dataServers", name)
	c := q.Consume()
	go func() {
		time.Sleep(time.Second)
		q.Close()
	}()
	msg := <-c
	s, _ := strconv.Unquote(string(msg.Body))
	fmt.Printf("locate:%s",s)
	log.Printf("log:locate:%s",s)
	return s
}

func Exist(name string) bool {
	return Locate(name) != ""
}
