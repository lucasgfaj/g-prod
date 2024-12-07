FROM ruby:3.2

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

# Copiando o entrypoint
COPY ./entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# Configurando o entrypoint
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Comando principal (Rails server)
CMD ["rails", "server", "-b", "0.0.0.0"]
