package main

import (
	"crypto/sha256"
	"encoding/base64"
	"fmt"
	"io"
	"strings"

	"github.com/google/uuid"
)


func main() {
	fmt.Println(uuid.NewString())
	reader := io.TeeReader(strings.NewReader(""),&strings.Builder{})
	h := sha256.New()
	io.Copy(h,reader)
	fmt.Println(base64.StdEncoding.EncodeToString(h.Sum(nil)))

}