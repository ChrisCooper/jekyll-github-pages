FROM ubuntu:17.10

LABEL Author="Chris Cooper"

# -- Basic setup --

RUN apt-get update

RUN apt-get -y install build-essential patch zlib1g-dev libxml2-dev libxslt1-dev libssl-dev libreadline-dev zlib1g-dev liblzma-dev
RUN apt-get -y install libyaml-dev libsqlite3-dev libcurl4-openssl-dev libffi-dev

RUN apt-get -y install ruby-dev ruby

RUN apt-get install locales && \
    locale-gen en_US.UTF-8 && \
    localedef -i en_US -f UTF-8 en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get clean

RUN gem install bundler

# -- Image properties --

VOLUME /site

RUN bundle config --global path .gems

# Make sure nokogiri gem can find lxml2
RUN bundle config build.nokogiri -- --with-xml2-include=/usr/include/libxml2/ --use-system-libraries

WORKDIR /site

EXPOSE 4000
