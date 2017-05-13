FROM ruby:2.3-slim
RUN apt-get update -qq && apt-get install -y build-essential libmysqlclient-dev
RUN mkdir /workspace
WORKDIR /workspace
ADD Gemfile /workspace/Gemfile
ADD Gemfile.lock /workspace/Gemfile.lock
RUN bundle install
ADD . /workspace
