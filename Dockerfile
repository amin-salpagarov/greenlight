FROM golang:1.22.1

WORKDIR /app

#dependencies
COPY ["go.mod", "go.sum", "./"]
RUN go mod download
RUN go install github.com/pressly/goose/v3/cmd/goose@latest

#build
COPY ./ ./
RUN go build -o ./bin/app cmd/api/main.go

CMD ["./bin/app"]