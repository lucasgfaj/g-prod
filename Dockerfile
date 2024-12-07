FROM ruby:3.2-alpine
ENV TZ=America/Sao_Paulo

# Instalar dependências necessárias
RUN apk add --no-cache \
    bash \
    mysql-client \
    nodejs \
    npm

WORKDIR /var/www/g-prod

# Copiar Gemfile e Gemfile.lock primeiro para otimizar a camada do Docker
COPY Gemfile Gemfile.lock ./

# Instalar dependências do Rails (gemas)
RUN bundle install

# Copiar o restante do código Rails
COPY . .

# Instalar dependências JavaScript
RUN npm install

# Comando padrão para iniciar o servidor Rails com Puma
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
