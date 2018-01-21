FROM ruby:2.4.0

ENV APP_ROOT /spree/commerce
ENV SPREE_ROOT /spree/spree
ENV AUTH_ROOT /spree/spree_auth_devise
ENV GATEWAY_ROOT /spree/spree_gateway
ENV I18N_ROOT /spree/spree_i18n

RUN apt-get update -qq && apt-get install -y build-essential nodejs vim imagemagick

RUN cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

COPY ./commerce $APP_ROOT
COPY ./spree $SPREE_ROOT
COPY ./spree_auth_devise $AUTH_ROOT
COPY ./spree_gateway $GATEWAY_ROOT
COPY ./spree_i18n $I18N_ROOT

WORKDIR $APP_ROOT
RUN bundle install

