FROM ruby:3.3

WORKDIR /app

COPY ./infra/app/Gemfile ./infra/app/Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
