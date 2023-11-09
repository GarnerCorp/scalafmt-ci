# Scalafmt GitHub Action

Runs `scalafmt --list` on your repository automatically with every push.

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
        with:
          fetch-depth: 1
      - name: Checking your code to see if u r naughty or nice
        uses: garnercorp/scalafmt-ci@v3
        with:
          args: "--exclude=third_party --list"
```
