FROM ruby:3.2.4

RUN mkdir -pv /app

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

CMD [ "bundle", "exec", "rails", "server", "-b", "0.0.0.0"]