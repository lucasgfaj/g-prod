# Use uma imagem base Ruby com a versão necessária
FROM ruby:3.3.4-slim

# Instalar dependências do sistema necessárias para Rails e MySQL
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libjemalloc2 \
    libvips \
    nodejs \
    yarn \
    build-essential \
    default-libmysqlclient-dev \
    git \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

# Definir variáveis de ambiente para o Rails
ENV RAILS_ENV=production \
    BUNDLE_DEPLOYMENT=1 \
    BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_WITHOUT=development

# Criar o diretório de trabalho e definir como o diretório do projeto
WORKDIR /g-prod

# Copiar o Gemfile e Gemfile.lock para o contêiner e instalar as dependências Ruby
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copiar todo o código-fonte para o contêiner
COPY . .

# Garantir que o binário do Rails tenha permissões de execução
RUN chmod +x ./bin/rails

# Definir a chave secreta do Rails para evitar erro durante a pré-compilação de assets
# Ajuste conforme necessário (se você tiver um arquivo master.key, adicione ele no contêiner ou defina o valor correto)
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile --trace

# Garantir que o master.key esteja presente se necessário
# Se você não tiver master.key, gere-o com rails credentials:edit e copie-o para o contêiner
# RUN ENV RAILS_MASTER_KEY="<your_master_key_here>"

# Criar usuário e grupo rails para uma execução mais segura (não como root)
RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails db log storage tmp

USER rails

# Definir o entrypoint para preparar o banco de dados ao iniciar o contêiner
ENTRYPOINT ["/g-prod/bin/docker-entrypoint"]

# Comando padrão para iniciar o servidor Rails
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]

# Expor a porta para o servidor Rails
EXPOSE 3000
