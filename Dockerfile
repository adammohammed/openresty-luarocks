FROM debian:buster-slim

RUN apt-get update && apt-get -y install wget gnupg ca-certificates && \
    wget -O - https://openresty.org/package/pubkey.gpg | apt-key add - && \
    echo "deb http://openresty.org/package/debian buster openresty" \
    | tee /etc/apt/sources.list.d/openresty.list && \
    apt-get update && \
    apt-get install -yq build-essential openresty debhelper unzip

COPY . /app/openresty-luarocks
