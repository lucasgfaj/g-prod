FROM ruby:3.2-alpine

# Instala pacotes
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libxml2-dev \
    libffi-dev

# Configura o diretór
WORKDIR /app

# Copia Gemfile e Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instala dependências
RUN bundle install

# Copia o restante da aplicação
COPY . .

# Copia o arquivo de configuração entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


# Comando de Inicialização
ENTRYPOINT ["/entrypoint.sh"]

