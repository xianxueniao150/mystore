package temp

import (
	"mystore/dataServer/locate"
	"os"
)

func commitTempObject(datFile string, tempinfo *tempInfo) {
	os.MkdirAll(os.Getenv("STORAGE_ROOT") + "/objects/", 0777)
	os.Rename(datFile, os.Getenv("STORAGE_ROOT")+"/objects/"+tempinfo.Name)
	locate.Add(tempinfo.Name)
}
