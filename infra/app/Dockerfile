FROM ruby:3.3

WORKDIR /app

# srcディレクトリからGemfileとGemfile.lockをコピー
COPY ./src/Gemfile ./src/Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
