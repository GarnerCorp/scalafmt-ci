#!/bin/sh
SCALAFMT_PATH="/tmp/scalafmt/${scalafmt_version}"
mkdir -p "$SCALAFMT_PATH"
(
    echo "SCALAFMT_PATH=$SCALAFMT_PATH"
    echo "scalafmt_version=$scalafmt_version"
) >> "$GITHUB_ENV"
(
    echo "$SCALAFMT_PATH"
    echo "$action_path"
) >> "$GITHUB_PATH"
