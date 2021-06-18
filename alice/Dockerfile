FROM ruby:2.6.4-alpine

ENV APP_PATH /var/app
ENV BUNDLE_VERSION 2.1.4
ENV BUNDLE_PATH=/bundle/vendor
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000
ENV PATH=$APP_PATH/bin:$PATH

RUN apk update

RUN apk add --virtual build-dependencies \
  build-base \
  bash \
  gcc \
  wget \
  git \
  postgresql-dev \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  npm \
  tzdata \
  && mkdir -p $APP_PATH

RUN npm install yarn -g

# navigate to app directory
WORKDIR $APP_PATH

# copy entrypoint scripts and grant execution permissions
COPY ./dev-entrypoint.sh /usr/local/sbin/dev-entrypoint.sh
COPY ./test-entrypoint.sh /usr/local/sbin/test-entrypoint.sh
RUN chmod +x /usr/local/sbin/dev-entrypoint.sh && chmod +x /usr/local/sbin/test-entrypoint.sh

COPY Gemfile $APP_PATH/Gemfile
COPY Gemfile.lock $APP_PATH/Gemfile.lock

RUN gem install bundler --version "$BUNDLE_VERSION" \
  && rm -rf $GEM_HOME/cache/*

COPY . $APP_PATH

EXPOSE $RAILS_PORT

# Start the main process.
CMD [ "bundle", "exec", "rails", "server", "-p", "3000", "-b", "0.0.0.0"]