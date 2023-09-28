FROM alpine:3.18

RUN apk update
RUN apk add --no-cache texlive
RUN rm -rf /var/cache/apk/*
