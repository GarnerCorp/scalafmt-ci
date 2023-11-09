#!/bin/sh
output=$(mktemp)
warnings=$(mktemp)
errors=$(mktemp)

enforce_scala_format_version() {
  if [ -e .scalafmt.conf ]; then
    perl -pi -e 'next unless s/^\s*(version)=.*/$1=$ENV{scalafmt_version}/' .scalafmt.conf
  fi
}

enforce_scala_format_version
scalafmt --non-interactive $args > "$output" 2> "$warnings"
result=$?
cat "$output"
cat "$warnings" >&2
[ $result -eq 0 ] && exit

report() {
    file="$1"
    summary="$2"

    [ -s "$file" ] || return
    echo "<details><summary>$summary</summary>"
    echo
    echo '```'
    perl -pe 's/$ENV{GITHUB_WORKSPACE}//g' "$file"
    echo '```'
    echo '</details>'
    echo
}

source="$output" errors="$errors" extract-errors.pl
source="$warnings" errors="$errors" extract-errors.pl

(
    echo "# scalafmt failed ($result)"
    if [ -s "$errors" ]; then
      echo '# Errors'
      cat "$errors"
    fi
    report "$warnings" "Warnings"
    report "$output" "Status"
) >> "$GITHUB_STEP_SUMMARY"
exit $result
