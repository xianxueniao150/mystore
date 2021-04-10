package main

import (
	"mystore/dataServer/heartbeat"
	"mystore/dataServer/locate"
	"mystore/dataServer/objects"
	"log"
	"net/http"
	"os"
)

func main() {
	log.SetFlags(log.Lshortfile | log.Ltime)
	go heartbeat.StartHeartbeat()
	go locate.StartLocate()
	http.HandleFunc("/objects/", objects.Handler)
    log.Println("启动成功")
	log.Fatal(http.ListenAndServe(os.Getenv("LISTEN_ADDRESS"), nil))
}
