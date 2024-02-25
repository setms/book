FROM rust:1.76.0-slim AS build
RUN apt-get update && \
    apt-get install -y libssl-dev pkg-config ca-certificates build-essential make perl gcc libc6-dev
RUN cargo install mdbook-bib --verbose

FROM michaelfbryan/mdbook-docker-image
COPY --from=build /usr/local/bin/mdbook* /bin/
VOLUME /data/src
