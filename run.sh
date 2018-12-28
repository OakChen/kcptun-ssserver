#! /bin/sh

docker run -d --restart=always -p 8388:8388 -p 8388:8388/udp -p 29900:29900/udp oakchen/kcptun-shadowsocks
