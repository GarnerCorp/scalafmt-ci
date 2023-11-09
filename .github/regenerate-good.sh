#!/bin/sh
act -W .github/workflows/test-regenerate-good.yml 2>/dev/null |
perl -ne '
    unless ($state) {
        $state = 1 if (/run-scalafmt\.sh/);
        next;
    }
    if ($state == 1) {
        $state = 2 if (/docker exec/);
        next;
    }
    last unless s/^.*\| //;
    print;
' > .github/testdata/Good.scala
