FROM ruby:2.2-slim
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev
RUN mkdir /api
WORKDIR /api
ADD Gemfile /api/Gemfile
ADD Gemfile.lock /api/Gemfile.lock
RUN bundle install
ADD . /api
