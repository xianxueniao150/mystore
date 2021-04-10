package main

import (
	"log"
	"mystore/apiServer/heartbeat"
	"mystore/apiServer/locate"
	"mystore/apiServer/objects"
	"mystore/apiServer/versions"
	"net/http"
	"os"
)

func main() {
	log.SetFlags(log.Lshortfile | log.Ltime)
	go heartbeat.ListenHeartbeat()
	http.HandleFunc("/objects/", objects.Handler)
	http.HandleFunc("/locate/", locate.Handler)
	http.HandleFunc("/versions/", versions.Handler)
	log.Fatal(http.ListenAndServe(os.Getenv("LISTEN_ADDRESS"), nil))
}
