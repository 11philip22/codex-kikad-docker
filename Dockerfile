ARG KICAD_IMAGE=kicad/kicad:10.0-full

FROM node:24-bookworm-slim AS codex
ARG KICAD_CODEX_VERSION=latest
RUN npm install --global "@openai/codex@${KICAD_CODEX_VERSION}" \
    && npm cache clean --force

FROM ${KICAD_IMAGE}
USER root

COPY --from=codex /usr/local/ /usr/local/
RUN apt-get update \
    && apt-get install --yes --no-install-recommends ca-certificates curl git ripgrep \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /root/.codex /workspace

ENV HOME=/root \
    CODEX_HOME=/root/.codex \
    TERM=xterm-256color
COPY codex-config.toml /etc/codex/config.toml
WORKDIR /workspace
ENTRYPOINT []
CMD ["codex"]
