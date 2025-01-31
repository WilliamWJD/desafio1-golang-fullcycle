FROM golang:1.22-alpine AS builder
WORKDIR /app

COPY go.mod ./
COPY main.go ./

RUN go mod tidy && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o desafio .

FROM scratch
WORKDIR /app

COPY --from=builder /app/desafio .

CMD ["./desafio"]
