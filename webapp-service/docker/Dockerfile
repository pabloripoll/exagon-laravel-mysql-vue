FROM golang:1.18

# Application location on container
WORKDIR /go/src/fiber

# Dependency from host machine - Depends on "docker-compose.yml->build->context" path directory
COPY . .

# Once container built compile the program from host - Depends on "docker-compose.yml->build->context" path directory
RUN go build -o bin/server app/main.go

CMD ["./bin/server"]