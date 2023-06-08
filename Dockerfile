FROM golang:1.20 AS builder

WORKDIR /

COPY ./fullcycle.go .

RUN go mod init fullcycle && go build fullcycle.go

# ENTRYPOINT [ "./fullcycle" ]

FROM scratch
WORKDIR /
COPY --from=builder /fullcycle .
ENTRYPOINT [ "./fullcycle" ]

