FROM ruby:2.7.8

RUN apt-get update && apt-get install -y libcurl4-openssl-dev

RUN mkdir -p /src
COPY ./Gemfile /src
COPY ./Gemfile.lock /src
WORKDIR /src
RUN gem install bundler:2.4.22
RUN bundle install

COPY . /src

CMD ["bash", "/src/script/buildtest"]