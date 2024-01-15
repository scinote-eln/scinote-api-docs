FROM ruby:2.6-slim

EXPOSE 4567
ENV APP_HOME /srv/slate
RUN mkdir /srv/slate 
WORKDIR /srv/slate
COPY ./Gemfile /srv/slate/
ENV BUNDLE_PATH /usr/local/bundle/

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        nodejs \
    && gem install bundler -v 2.4.22 \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && ls -la

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]

