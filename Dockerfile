FROM golang:latest as builder

WORKDIR /app
COPY . .

# Gera o binário da aplicação com todas as dependências embutidas
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM scratch
COPY --from=builder /app/app app

ENTRYPOINT ["/app"]
