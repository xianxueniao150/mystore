package objects

import (
	"mystore/apiServer/locate"
	"fmt"
	"io"
	"mystore/utils/objectstream"
)

func getStream(object string) (io.Reader, error) {
	server := locate.Locate(object)
	if server == "" {
		return nil, fmt.Errorf("object %s locate fail", object)
	}
	return objectstream.NewGetStream(server, object)
}
