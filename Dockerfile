FROM ubuntu

RUN sed -i -e 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -y wget && \
    cd /tmp && \
    wget https://github.com/ethcore/parity/releases/download/v1.3.8/parity_1.3.8-0_amd64.deb && \
    dpkg -i parity*.deb && \
    rm parity*.deb && \
    apt-get autoremove wget -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /root/.parity

EXPOSE 8545
ENTRYPOINT ["parity", "--jsonrpc-interface", "all", "--jsonrpc-hosts", "all"]
