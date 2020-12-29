FROM centos:centos7

ENV PATH /opt/go/bin:/go/bin:$PATH
ENV GOPATH /go

ARG GOLANG_VERSION="1.15"

RUN yum install rpm-build git make gcc -y \
        && cd /opt \
        && curl -L -O https://dl.google.com/go/go${GOLANG_VERSION}.linux-amd64.tar.gz \
        && tar vzfx go${GOLANG_VERSION}.linux-amd64.tar.gz \
        && rm -f go${GOLANG_VERSION}.linux-amd64.tar.gz \
        && go get golang.org/x/tools/cmd/goimports \
        && go get golang.org/x/lint/golint \
        && go get github.com/digitalocean/go-smbios/smbios \
        && go get golang.org/x/crypto/ssh/terminal \
        && go get github.com/kylelemons/godebug/pretty \
        && go get github.com/kylelemons/godebug/diff \
        && rm -rf /var/cache/yum \
        && go version
