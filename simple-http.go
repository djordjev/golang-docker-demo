package main

import (
	"net/http"
	"fmt"
	"strings"
)

func main() {
	http.HandleFunc("/", Handler)
	http.ListenAndServe(":3001", nil)
}

func Handler(response http.ResponseWriter, request *http.Request) {
	query := request.URL.Query()

	responseSlice := make([]string, 0)

	for key, val := range query {
		responseSlice = append(responseSlice, fmt.Sprintf("Key: %s and valie %s", key, val))
	}

	answer := "Hello, queries you set are:"
	response.Write([]byte(fmt.Sprintf("%s\n%s", answer, strings.Join(responseSlice, "\n"))))
}
