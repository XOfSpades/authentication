FROM bitwalker/alpine-elixir:1.4.0

MAINTAINER bernhard.stoecker@recogizer.de

ARG mix_env
RUN echo Using mix env $mix_env

RUN apk add --update bash && rm -rf /var/cache/apk/*

RUN mix local.hex --force && \
    mix local.rebar --force

RUN mkdir /resources
RUN mkdir /authentication

WORKDIR /authentication


RUN mkdir /authentication/_build
RUN mkdir -p /authentication/config
RUN mkdir /authentication/lib

COPY mix.exs /authentication/mix.exs
COPY mix.lock /authentication/mix.lock

RUN MIX_ENV=$mix_env mix do deps.get, deps.compile


COPY config/config.exs /authentication/config/config.exs
COPY config/test.exs /authentication/config/test.exs
COPY config/dev.exs /authentication/config/dev.exs
COPY config/prod.exs /authentication/config/prod.exs

COPY priv /authentication/priv

COPY lib /authentication/lib
COPY web /authentication/web

RUN MIX_ENV=$mix_env mix compile
