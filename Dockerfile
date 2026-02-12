FROM debian:13 as aqua
RUN apt-get update \
 && apt-get install -y curl
RUN curl -sSfL https://raw.githubusercontent.com/aquaproj/aqua-installer/v4.0.4/aqua-installer | bash -s -- -v v2.56.6
COPY aqua.yaml /aqua.yaml
RUN /root/.local/share/aquaproj-aqua/bin/aqua -c /aqua.yaml cp -o /dist helm

FROM gcr.io/distroless/base-debian13
COPY --from=aqua /dist/helm /bin/helm
ENTRYPOINT ["helm"]
