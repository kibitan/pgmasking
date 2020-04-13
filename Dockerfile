FROM golang:1.14-alpine AS builder
WORKDIR /go/src/app
RUN addgroup -S app && adduser -S -G app app
USER app
COPY . .
RUN go get -d -v ./...
RUN go install -v ./...

FROM builder AS with-postgres-client
USER root
RUN apk add --no-cache postgresql-client=12.2-r0
USER app

FROM alpine:3.11
WORKDIR /srv
RUN addgroup -S app && adduser -S -G app app
USER app
COPY --from=builder --chown=app /go/bin/pgmasking .
ENTRYPOINT ["./pgmasking"]
