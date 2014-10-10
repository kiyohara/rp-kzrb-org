FROM ubuntu
MAINTAINER Tomokazu Kiyohara "tomokazu.kiyohara@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get install -y ruby1.9.3
RUN apt-get install -y ruby-dev
RUN apt-get install -y make
RUN apt-get -y install libssl-dev

RUN gem install --no-ri --no-rdoc bundle

RUN mkdir -p /opt/rp-kzrb-org

ADD Gemfile /opt/rp-kzrb-org/Gemfile
ADD Gemfile.lock /opt/rp-kzrb-org/Gemfile.lock
ADD config.ru /opt/rp-kzrb-org/config.ru

WORKDIR /opt/rp-kzrb-org
RUN bundle install

CMD bundle exec rackup config.ru -s puma -p 80

EXPOSE 80
