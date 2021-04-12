package temp

import (
	"mystore/dataServer/locate"
	"mystore/utils"
	"net/url"
	"os"
	"strconv"
	"strings"
)

func (t *tempInfo) hash() string {
	s := strings.Split(t.Name, ".")
	return s[0]
}

func (t *tempInfo) id() int {
	s := strings.Split(t.Name, ".")
	id, err := strconv.Atoi(s[1])
	utils.PrintError(err)
	return id
}

func commitTempObject(datFile string, tempinfo *tempInfo) {
	f, _ := os.Open(datFile)
	d := url.PathEscape(utils.CalculateHash(f))
	f.Close()
	err:=os.Rename(datFile, os.Getenv("STORAGE_ROOT")+"/objects/"+tempinfo.Name+"."+d)
	utils.PrintError(err)
	locate.Add(tempinfo.hash(), tempinfo.id())
}
