package main

import (
  "fmt"
   "net/http"
   "os"
   // "time"
)

var version string
var hostname string

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "request from %s done!", hostname)
}

func healthz(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "version %s, all peachy!", version)
}

func main() {
  port := os.Getenv("PORT")
  hostname, _ = os.Hostname()

  fmt.Printf("Starting miniserver version %s on %s\n", version, hostname)

  http.HandleFunc("/", handler)
  http.HandleFunc("/healthcheck", healthz)
  http.ListenAndServe(port, nil)
}
