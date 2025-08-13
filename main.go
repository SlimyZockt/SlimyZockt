package main

import (
	"fmt"
	"net/http"
)

const PORT = ":8080"

func main() {
	router := http.NewServeMux()

	router.Handle("/", http.FileServer(http.Dir("include_dir")))
	fmt.Println(http.ListenAndServe(PORT, router))

}
