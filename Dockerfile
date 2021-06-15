FROM golang:alpine
COPY . ./src/github.com/thekvs/microproxy
RUN go get github.com/thekvs/microproxy
FROM alpine
COPY --from=0 /go/bin/ /usr/local/bin/
COPY microproxy-docker.toml .
CMD ["microproxy", "--config", "microproxy-docker.toml"]
EXPOSE 3129
