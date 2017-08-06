FROM ruby:2.4.1-alpine


#  Timezone
#-----------------------------------------------
ENV TIMEZONE Asia/Tokyo

RUN apk add --no-cache --update tzdata \
  && ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime


#  Library
#-----------------------------------------------
RUN apk add --no-cache --update \
  build-base \
  postgresql-dev


#  App
#-----------------------------------------------
WORKDIR /app
