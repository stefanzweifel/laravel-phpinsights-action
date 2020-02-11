FROM php:7.4.2-cli-alpine

LABEL "com.github.actions.name"="Laravel PHP Insights Action"
LABEL "com.github.actions.description"="Run PHP Insights"
LABEL "com.github.actions.icon"="bar-chart-2"
LABEL "com.github.actions.color"="blue"

LABEL "repository"="http://github.com/stefanzweifel/laravel-phpinsights-action"
LABEL "homepage"="http://github.com/stefanzweifel/laravel-phpinsights-action"
LABEL "maintainer"="Stefan Zweifel <hello@stefanzweifel.io>"

# fix work iconv library with alphine
# https://github.com/nunomaduro/phpinsights/issues/43#issuecomment-498108857
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
