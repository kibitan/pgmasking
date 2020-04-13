#!/bin/sh

set -Ceu
# set -vx # for debug

POSTGRES_HOST=${POSTGRES_HOST:-localhost}
POSTGRES_USER=${POSTGRES_USER:-postgres}
POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-password}
POSTGRES_DBNAME=${POSTGRES_DBNAME:-pgmasking_acceptance}

FILEDIR="$( cd "$( dirname "$0" )" && pwd )"
alias _psql='PGPASSWORD="$POSTGRES_PASSWORD" psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" "$POSTGRES_DBNAME"'

## clear tmp file
rm "$FILEDIR"/tmp/* || echo 'no tmp file'

## clear table if exists
if (_psql -c '\dt' | grep users) > /dev/null 2>&1; then
  _psql < "$FILEDIR/drop_table.sql" > /dev/null
fi

## import database
_psql < "$FILEDIR/import_dumpfile.sql" > /dev/null

## pgmasking
PGPASSWORD="$POSTGRES_PASSWORD" pg_dump --no-owner -h "$POSTGRES_HOST" -U "$POSTGRES_USER" "$POSTGRES_DBNAME" | pgmasking -c "$FILEDIR/masking.yml" > "$FILEDIR/tmp/masking_dumpfile.sql"

## compare
_psql < "$FILEDIR/drop_table.sql" > /dev/null
_psql < "$FILEDIR/tmp/masking_dumpfile.sql" > /dev/null
_psql -c '\x' -c 'SELECT * FROM users ORDER BY id;' > "$FILEDIR/tmp/query_result.txt"
diff "$FILEDIR/tmp/query_result.txt" "$FILEDIR/expected_query_result.txt" && echo 'test passed!'
