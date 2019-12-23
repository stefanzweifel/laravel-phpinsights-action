# laravel-phpinsights-action

This GitHub Action executes Laravel Artisan Command of [phpinsights](https://github.com/nunomaduro/phpinsights). The output of the Insights Command can be viewed in the Actions log.

You can optionally define minimum values for Insights categories. If the value falls below your given threshold, the run fails.

### Usage

This Action doesn't install composer dependencies on it's own and doesn't contain a `phpinsights` binary.

It's therefore required that `phpinsights` is set as a dependency in your project and that another Action installs the composer dependencies.

An example Workflow can look like this.

```yaml
name: PHP Insights

on: push

jobs:
  phpinsights:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1

    - uses: MilesChou/composer-action@master
      with:
        args: install -q --no-ansi --no-interaction --no-scripts --no-suggest --no-progress --prefer-dist

    - uses: stefanzweifel/stefanzweifel/laravel-phpinsights-action@v1.0.0
```


### Arguments

You can pass any valid `phpinsights` argument to the Action. In this example, all issues are always displayed and a minimum value of 80 has to be achieved in all categories.

```yaml
name: PHP Insights

on: push

jobs:
  phpinsights:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1

    - uses: MilesChou/composer-action@master
      with:
        args: install -q --no-ansi --no-interaction --no-scripts --no-suggest --no-progress --prefer-dist

    - uses: stefanzweifel/stefanzweifel/laravel-phpinsights-action@v1.0.0
      with:
        args: -v --min-quality=80 --min-complexity=80 --min-architecture=80 --min-style=80 --disable-security-check
```

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/stefanzweifel/laravel-phpinsights-action/tags).

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/stefanzweifel/laravel-phpinsights-action/blob/master/LICENSE) file for details.
