FROM ubuntu
MAINTAINER Oak Chen <oak@sfysoft.com>

# libsodium23用于支持更多加密算法，如chacha20
# openssl 1.1.0以后，不再有EVP_CIPHER_CTX_cleanup函数
RUN apt-get update -y && \
    apt-get install -y supervisor shadowsocks kcptun libsodium23 && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    sed -i "s/EVP_CIPHER_CTX_cleanup/EVP_CIPHER_CTX_reset/g" /usr/lib/python2.7/dist-packages/shadowsocks/crypto/openssl.py

COPY supervisord.conf /etc/supervisor/
COPY shadowsocks.conf /etc/supervisor/conf.d/

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV SS_PASSWORD=WSXedcTGB SS_METHOD=chacha20 SS_TIMEOUT=600
ENV KCP_CRYPT=aes KCP_KEY=WSXedcTGB KCP_MODE=fast KCP_MTU=1350 KCP_SNDWND=1024 KCP_RCVWND=1024 KCP_DATASHARD=10 KCP_PARITYSHARD=3

EXPOSE 8388/tcp
EXPOSE 8388/udp
EXPOSE 29900/udp

ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
