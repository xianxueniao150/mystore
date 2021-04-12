package main

import (
	"log"
	"mystore/dataServer/heartbeat"
	"mystore/dataServer/locate"
	"mystore/dataServer/objects"
	"mystore/dataServer/temp"
	"net/http"
	"os"
)

func main() {
	log.SetFlags(log.Lshortfile | log.Ltime)
	os.MkdirAll(os.Getenv("STORAGE_ROOT") + "/temp/", 0777)
	os.MkdirAll(os.Getenv("STORAGE_ROOT") + "/objects/", 0777)
	locate.CollectObjects()
	go heartbeat.StartHeartbeat()
	go locate.StartLocate()
	http.HandleFunc("/objects/", objects.Handler)
	http.HandleFunc("/temp/", temp.Handler)
	log.Fatal(http.ListenAndServe(os.Getenv("LISTEN_ADDRESS"), nil))
}

