# base image
FROM --platform=linux/amd64 rust:slim-bookworm AS builder

RUN apt-get update \
    && apt-get install -y gcc g++ libc6-dev pkg-config libssl-dev wget protobuf-compiler

# working directory
WORKDIR /app

# supervisord to manage programs
RUN wget -O supervisord http://public.artifacts.marlin.pro/projects/enclaves/supervisord_master_linux_amd64
RUN chmod +x supervisord

# transparent proxy component inside the enclave to enable outgoing connections
RUN wget -O ip-to-vsock-transparent http://public.artifacts.marlin.pro/projects/enclaves/ip-to-vsock-transparent_v1.0.0_linux_amd64
RUN chmod +x ip-to-vsock-transparent

# proxy to expose attestation server outside the enclave
RUN wget -O vsock-to-ip http://public.artifacts.marlin.pro/projects/enclaves/vsock-to-ip_v1.0.0_linux_amd64
RUN chmod +x vsock-to-ip

# dnsproxy to provide DNS services inside the enclave
RUN wget -qO- https://github.com/AdguardTeam/dnsproxy/releases/download/v0.73.3/dnsproxy-linux-amd64-v0.73.3.tar.gz | tar xvz
RUN mv linux-amd64/dnsproxy ./ && chmod +x dnsproxy

RUN wget -O ic_tee_nitro_gateway https://github.com/ldclabs/ic-tee/releases/download/v0.2.11/ic_tee_nitro_gateway
RUN chmod +x ic_tee_nitro_gateway

RUN wget -O anda_bot https://github.com/ldclabs/anda/releases/download/v0.3.3/anda_bot
RUN chmod +x anda_bot

FROM --platform=linux/amd64 debian:bookworm-slim AS runtime

# install dependency tools
RUN apt-get update \
    && apt-get install -y net-tools iptables iproute2 ca-certificates tzdata openssl \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY --from=builder /app /app/
# working directory
WORKDIR /app

# supervisord config
COPY agents/anda_bot/nitro_enclave/supervisord.conf /etc/supervisord.conf
# setup.sh script that will act as entrypoint
COPY agents/anda_bot/nitro_enclave/Config.toml agents/anda_bot/nitro_enclave/Character.toml agents/anda_bot/nitro_enclave/setup.sh ./
RUN chmod +x setup.sh && ls -la

ENV LOG_LEVEL=info
ENV RUST_MIN_STACK=8388608

# entry point
ENTRYPOINT [ "/app/setup.sh" ]