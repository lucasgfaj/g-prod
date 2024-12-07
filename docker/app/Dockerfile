FROM ruby:3.2-alpine
ENV TZ=America/Sao_Paulo

# Instalar dependências necessárias
RUN apk add --no-cache \
    bash \
    mysql-client \
    nodejs \
    npm

WORKDIR /var/www/g-prod

# Copiar o código da aplicação Rails
COPY . .

# Instalar dependências do Rails
RUN bundle install

# Comando padrão para iniciar o servidor Rails com Puma
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
