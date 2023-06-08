FROM golang:1.20 AS builder

WORKDIR /

COPY . .

RUN go mod init fullcycle && go build fullcycle.go

# ENTRYPOINT [ "./fullcycle" ]

FROM scratch
WORKDIR /
COPY --from=builder /fullcycle .
ENTRYPOINT [ "./fullcycle" ]

