FROM debian:12 as install
RUN apt-get update \
 && apt-get install -y curl
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
 && chmod 700 get_helm.sh \
 && ./get_helm.sh -v v3.5.3

FROM gcr.io/distroless/base-debian12
COPY --from=install /usr/local/bin/helm /usr/local/bin/helm
ENTRYPOINT ["helm"]
