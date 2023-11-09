# Scalafmt GitHub Action

Run `scalafmt` on your repository automatically with every push.

By default, it runs with `--list`, but that's configurable.

Uses [scalafmt-native](https://github.com/mroth/scalafmt-native) under the hood
to keep things small and booting super quick by avoiding the JVM. :racehorse:

## Usage

Simply add a step such as the following to your your workflow yml file:

```yml
- name: Check for scalafmt conformance
  uses: garnercorp/scalafmt-ci@v3
```

Example in the full context of a workflow file, with some optional arguments:

```yml
name: Check scalafmt on push
on: [push]

jobs:
  scalafmt-lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Checking your code to see if u r naughty or nice
        uses: garnercorp/scalafmt-ci@v3
        with:
          args: "--exclude=third_party --list"
          version: 3.7.17
```

## Compatibility

### v2 to v3

- [v2](https://github.com/garnerCorp/scalafmt-ci/tree/v2) is built around [scalafmt](https://github.com/scalameta/scalafmt) [`3.5.2`](https://github.com/scalameta/scalafmt/releases/tag/v3.5.2), [v3](https://github.com/garnerCorp/scalafmt-ci/tree/v3) is built around scalafmt [`3.7+`](https://github.com/scalameta/scalafmt/releases/tag/v3.7.15)
  - The formatting defaults have changed
  - `--list --test` is no longer accepted as arguments, you should try just one of them.
