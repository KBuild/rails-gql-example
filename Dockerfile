FROM ruby:2.7.2-alpine3.13

RUN apk update && \
    apk upgrade && \
    apk add --no-cache linux-headers libxml2-dev make gcc g++ libc-dev nodejs tzdata postgresql-dev postgresql libsass-dev && \
    apk add --virtual build-packages --no-cache build-base curl-dev

WORKDIR /usr/src/app

COPY . /usr/src/app/

RUN bundle install
RUN apk del build-packages
RUN chmod 755 /usr/src/app/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]