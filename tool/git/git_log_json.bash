#!/bin/bash
# attempting to be the most robust solution for outputting git log as JSON,
# using only `git` and the standard shell functions, without requiring
# additional software.
#
# - uses traditional JSON camelCase
# - includes every major field that git log can output, including the body
# - proper sections for author, committer, and signature
# - multiple date formats (one for reading, ISO for parsing)
# - should properly handle (most? all?) body values, even those that contain
#   quotation marks and escaped characters
# - outputs as minimized JSON, can be piped to `jq` for pretty printing
# - can run against the current directory as `git-log-json` or against a file
#   or folder with `git-log-json foo`
# - easily piped into `jq`, e.g. this will get all the commit subjects:
#   $ git-log-json foo | jq -r '.[] | .subject'
#
# credit to @nsisodiya, @varemenos, @overengineer, and others for the
# original working code:
# https://gist.github.com/varemenos/e95c2e098e657c7688fd
# april: https://gist.github.com/april/ee2e104b1435f3113e67663d8875bbef
# isaacs: https://gist.github.com/april/ee2e104b1435f3113e67663d8875bbef?permalink_comment_id=4383852#gistcomment-4383852

git_log_json() {
  local Q=$'\x01'-$RANDOM-$(date +%s)
  local FORMAT=--pretty=format:"{${Q}author${Q}:{${Q}name${Q}:${Q}%aN${Q},${Q}email${Q}:${Q}%aE${Q},${Q}date${Q}:${Q}%aD${Q},${Q}dateISO8601${Q}:${Q}%aI${Q}},${Q}body${Q}:${Q}%b${Q},${Q}commitHash${Q}:${Q}%H${Q},${Q}commitHashAbbreviated${Q}:${Q}%h${Q},${Q}committer${Q}:{${Q}name${Q}:${Q}%cN${Q},${Q}email${Q}:${Q}%cE${Q},${Q}date${Q}:${Q}%cD${Q},${Q}dateISO8601${Q}:${Q}%cI${Q}},${Q}encoding${Q}:${Q}%e${Q},${Q}notes${Q}:${Q}%N${Q},${Q}parent${Q}:${Q}%P${Q},${Q}parentAbbreviated${Q}:${Q}%p${Q},${Q}refs${Q}:${Q}%D${Q},${Q}signature${Q}:{${Q}key${Q}:${Q}%GK${Q},${Q}signer${Q}:${Q}%GS${Q},${Q}verificationFlag${Q}:${Q}%G?${Q}},${Q}subject${Q}:${Q}%s${Q},${Q}subjectSanitized${Q}:${Q}%f${Q},${Q}tree${Q}:${Q}%T${Q},${Q}treeAbbreviated${Q}:${Q}%t${Q}},"

  git log "$FORMAT" $1 | \
    (
      echo -n '['
      sed -e ':a' -e 'N' -e '$!ba' \
        -e 's/,$//' \
        -e 's/'$Q'},\n{'$Q'/'$Q'},{'$Q'/g' \
        -e 's/\\/\\\\/g' \
        -e 's/\r//g' \
        -e 's/\n/\\n/g' \
        -e 's/\t/\\t/g' \
        -e 's/"/\\"/g' \
        -e 's/'$Q'/"/g'
      echo ']'
    )
}

git_log_json "$@"
