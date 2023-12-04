FROM ruby:3.2.2
WORKDIR /eventnxt
RUN apt update -qq && apt install -y \
  build-essential \
  ruby-dev \
  nodejs
COPY . /eventnxt
RUN gem install bundler
RUN bundle install
CMD rails s -b 0.0.0.0 -p $PORT
