FROM golang:1.25.1 AS builder

WORKDIR /app

COPY . .

RUN go mod download
RUN go build -o app .

FROM scratch

WORKDIR /app

COPY --from=builder /app/app .

CMD ["./app"]
