FROM golang:latest as builder

WORKDIR /usr/src/app

COPY main.go .

RUN go build main.go

FROM hello-world

COPY --from=builder /usr/src/app .

CMD [ "./main" ]