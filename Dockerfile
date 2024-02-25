FROM rust:1.76.0-slim AS build

ARG MDBOOK_VERSION="0.4.37"
ARG MDBOOK_ADMONISH_VERSION="1.15.0"
ARG MDBOOK_BIB_VERSION="0.0.6"
ARG MDBOOK_GRAPHVIZ_VERSION="0.1.4"
ARG MDBOOK_KATEX_VERSION="0.5.10"
ARG MDBOOK_MERMAID_VERSION="0.13.0"
ARG MDBOOK_PLANTUML_VERSION="0.8.0"

ENV CARGO_INSTALL_ROOT /usr/local/
ENV CARGO_TARGET_DIR /tmp/target/

RUN apt-get update && \
    apt-get install -y libssl-dev pkg-config ca-certificates build-essential make perl gcc libc6-dev

RUN cargo install mdbook --vers ${MDBOOK_VERSION} --verbose
RUN cargo install mdbook-admonish --vers ${MDBOOK_ADMONISH_VERSION} --verbose
RUN cargo install mdbook-bib --vers ${MDBOOK_BIB_VERSION} --verbose
# RUN cargo install mdbook-graphviz --vers ${MDBOOK_GRAPHVIZ_VERSION} --verbose
RUN cargo install mdbook-katex --vers ${MDBOOK_KATEX_VERSION} --verbose
RUN cargo install mdbook-mermaid --vers ${MDBOOK_MERMAID_VERSION} --verbose
RUN cargo install mdbook-plantuml --vers ${MDBOOK_PLANTUML_VERSION} --verbose

# Create the final image
FROM ubuntu:24.04

ENV RUST_LOG info

COPY --from=build /usr/local/bin/mdbook* /bin/

RUN apt-get update && apt-get install --no-install-recommends -y ca-certificates graphviz && rm -rf /var/cache/apt/lists

WORKDIR /data
VOLUME [ "/data" ]

ENTRYPOINT [ "/bin/mdbook" ]
