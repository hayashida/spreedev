FROM ruby:2.4.0

ENV APP_ROOT /spree/commerce

RUN apt-get update -qq && apt-get install -y build-essential nodejs vim imagemagick

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./commerce $APP_ROOT

WORKDIR $APP_ROOT
RUN bundle install

