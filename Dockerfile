FROM debian:12 as aqua
RUN apt-get update \
 && apt-get install -y curl
RUN curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v3.0.1/aqua-installer | bash -s -- -v v2.27.3
COPY aqua.yaml /aqua.yaml
RUN /root/.local/share/aquaproj-aqua/bin/aqua -c /aqua.yaml cp -o /dist helm

FROM gcr.io/distroless/base-debian12
COPY --from=aqua /dist/helm /bin/helm
ENTRYPOINT ["helm"]
