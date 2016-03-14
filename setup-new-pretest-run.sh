#!/bin/sh

REPORTURL="http://pretest.housegordon.org/upload"
IN="travis-yml.template"
OUT=".travis.yml"

die()
{
    BASE=$(basename "$0")
    echo "$BASE: error: $@" >&2
    exit 1
}


URL="$1"
test -z "$URL" && die "missing source URL to pretest"

DIR=$(dirname "$0")
cd "$DIR"

echo "$URL" \
    | grep -Eq '^(https?|ftp|git)://[-a-zA-Z0-9_\.]+/[-a-zA-Z0-9_\.\/\+\%]+$' \
    || die "source url ($URL) contains forbidden characters"

test -e "$IN" \
    || die "Template file ($IN) not found in ($DIR)"
test -d ".git" \
    || die "Error directory ($DIR) is not git-controlled"

wget --quiet --spider "$URL" \
    || die "Failed to HTTP/HEAD source url ($URL)"

# Prepare a new travis config file
sed -e "s|:REPORTURL:|$REPORTURL|" \
    -e "s|:SRCURL:|$URL|" "$IN" > "$OUT" \
    || die "failed to create travis config file ($OUT)"

# commit and push
git add "$OUT" \
    || die "failed to 'git add $OUT' file"

git commit -m "pretesting: $URL" \
    || die "failed to 'git commit'"

git push \
    || die "failed to git-push"
