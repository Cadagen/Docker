FROM debian:bookworm-slim

RUN apt-get update && \
    apt-get install -y \
      unzip \
      curl \
      procps

RUN curl -fsSL https://bun.sh/install | bash
ENV PATH="/root/.bun/bin:${PATH}"

ENV PATH="/app/binaries:${PATH}"

WORKDIR /app

COPY package.json /app/
COPY bun.lock /app/

RUN bun install

COPY . /app/
