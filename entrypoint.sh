#!/bin/sh

set -eu

php artisan insights -n $*
