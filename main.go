package main

import (
	"fmt"
	"log"
	"net/http"

	"github.com/dchest/uniuri"
)

func main() {
	randStr := uniuri.New()
	helloHandler := func(w http.ResponseWriter, req *http.Request) {
		fmt.Fprintf(w, "Hello, here's some generated string: %v", randStr)
	}

	http.HandleFunc("/hello", helloHandler)
	log.Fatal(http.ListenAndServe(":8080", nil))
}
