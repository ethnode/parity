FROM ubuntu

RUN apt-get update && \
    apt-get install -y wget libssl-dev && \
    cd /tmp && \
    wget https://parity-downloads-mirror.parity.io/v1.7.6/x86_64-unknown-linux-gnu/parity_1.7.6_amd64.deb && \
    dpkg -i parity*.deb && \
    rm parity*.deb && \
    apt-get autoremove wget -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /root/.local

EXPOSE 8545
ENTRYPOINT ["parity", "--jsonrpc-interface", "all", "--jsonrpc-hosts", "all", "--max-peers", "150"]
