FROM ubuntu:17.10

MAINTAINER Chris Cooper

# -- Basic setup --

RUN apt-get update

RUN apt-get -y install build-essential zlib1g-dev libxml2-dev libxslt1-dev libssl-dev libreadline-dev
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

WORKDIR /site

EXPOSE 4000

# Make gems available
#RUN bundle install

# bundle exec jekyll serve # to serve the site
# bundle update # to update gems

# This can be removed... it's just to shorten the next step while I'm on shitty wifi so it doesn't fail half way
#RUN gem install --source https://rubygems.org jekyll liquid coffee-script sass RedCloth octokit

#RUN gem install --source https://rubygems.org github-pages

#RUN apt-get -y install git-core curl sqlite3
#RUN apt-get install python-software-properties libffi-dev nodejs

#RUN apt-get -y install nodejs \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/






#ENTRYPOINT ["jekyll"]

# docker run --rm -v /mysite:/site -p 4000:4000 andredumas/github-pages serve --watch
