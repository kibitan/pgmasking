FROM golang:1.14-alpine AS builder
WORKDIR /go/src/app
COPY . .
# RUN go get -d -v ./...
RUN go install -v ./...

FROM alpine
WORKDIR /srv
RUN addgroup -S app && adduser -S -G app app
USER app
COPY --from=builder --chown=app /go/bin/pgmasking .
ENTRYPOINT ["./pgmasking"]
