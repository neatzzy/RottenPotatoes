FROM ruby:4.0.2-slim

# Instala as dependências do sistema necessárias para o Rails, SQLite e testes
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libvips sqlite3 libsqlite3-dev nodejs npm pkg-config libyaml-dev && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

WORKDIR /rails

# Copia os arquivos de dependência
COPY Gemfile Gemfile.lock ./

# Instala TODAS as gems (incluindo as de teste, como Cucumber e RSpec)
RUN bundle install

# Copia o resto do código
COPY . .

EXPOSE 3000

# Mantém o container vivo para você poder rodar comandos dentro dele
CMD ["tail", "-f", "/dev/null"]