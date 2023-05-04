FROM golang
COPY dispatcher.go .
RUN go build dispatcher.go 

FROM alpine
COPY --from=0 /go  .
RUN chmod 777 dispatcher.go
CMD ["dispatcher.go"]