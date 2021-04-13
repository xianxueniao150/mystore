package objects

import (
	"fmt"
	"log"
	"mystore/apiServer/heartbeat"
	"mystore/utils/rs"
)

func putStream(hash string, size int64) (*rs.RSPutStream, error) {
	servers := heartbeat.ChooseRandomDataServers(rs.ALL_SHARDS, nil)
	log.Printf("servers:%v",servers)
	if len(servers) != rs.ALL_SHARDS {
		return nil, fmt.Errorf("cannot find enough dataServer")
	}

	return rs.NewRSPutStream(servers, hash, size)
}
