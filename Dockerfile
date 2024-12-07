# Base image para Ruby
FROM ruby:3.2

# Instala pacotes essenciais para compilação
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    libxml2-dev \
    libffi-dev

# Configura o diretório de trabalho
WORKDIR /app

# Copia Gemfile e Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Instala dependências
RUN bundle install

# Copia o restante da aplicação
COPY . .

# Comando padrão
CMD ["rails", "server", "-b", "0.0.0.0"]

