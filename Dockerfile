FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY main.go .

RUN go mod init fullcycle

RUN go build -o main .

FROM scratch AS fullcycle

COPY --from=builder /app/main .

ENTRYPOINT ["./main"]
