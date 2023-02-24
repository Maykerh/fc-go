FROM golang:1.20-alpine3.17 AS build

WORKDIR /app

COPY /app .

RUN go build -v -o hello hello.go

FROM scratch

COPY --from=build /app/hello .

CMD ["./hello"]
