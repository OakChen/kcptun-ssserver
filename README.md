# kcptun-shadowsocks

A docker image for shadowsocks server with kcptun support, using official shadowsocks and kcptun in Ubuntu.

## Download from Docker Hub

    docker pull oakchen/kcptun-shadowsocks

## Usage

    docker run -d --restart=always -p 8388:8388 -p 8388:8388/udp -p 29900:29900/udp oakchen/kcptun-shadowsocks

or define a password, and use another port

    docker run -d --restart=always -e "SS_PASSWORD=123456" -p 443:8388 -p 443:8388/udp -p 29900:29900/udp oakchen/kcptun-shadowsocks

## Shadowsocks default parameter

    -k WSXedcTGB -m chacha20 -t 600

## kcptun default parameter

    --crypt aes --key WSXedcTGB --mode fast --mtu 1350 --sndwnd 1024 --rcvwnd 1024 --datashard 10 --parityshard 3 --nocomp --quiet

## Configurable parameters by environment variables

    SS_PASSWORD WSXedcTGB
    SS_METHOD   chacha20
    SS_TIMEOUT  600

    KCP_KEY     WSXedcTGB
    KCP_CRYPT   aes
    KCP_MODE    fast
    MTU         1350
    SNDWND      1024
    RCVWND      1024
    DATASHARD   10
    PARITYSHARD 3

