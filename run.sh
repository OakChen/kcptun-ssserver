#! /bin/sh

docker run -d --restart=always -p 8389:8388 -p 8389:8388/udp -p 29900:29900/udp oakchen/kcptun-shadowsocks
