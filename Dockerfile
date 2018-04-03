FROM ubuntu

RUN apt-get update && \
    apt-get install -y wget libssl-dev && \
    cd /tmp && \
    wget http://d1h4xl4cr1h0mo.cloudfront.net/v1.9.5/x86_64-unknown-linux-gnu/parity_1.9.5_ubuntu_amd64.deb && \
    dpkg -i parity*.deb && \
    rm parity*.deb && \
    apt-get autoremove wget -y && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /root/.local

EXPOSE 8545
ENTRYPOINT ["parity", "--jsonrpc-interface", "all", "--jsonrpc-hosts", "all"]
