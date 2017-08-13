FROM ruby:2.4.1-alpine3.6


#  Timezone
#-----------------------------------------------
ENV TIMEZONE Asia/Tokyo

RUN apk add --no-cache --update tzdata \
  && ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime


#  Library
#-----------------------------------------------
RUN apk add --no-cache --update \
  bash \
  build-base \
  postgresql-dev \
  nodejs \
  yarn


#  App
#-----------------------------------------------
WORKDIR /app
