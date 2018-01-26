#!/bin/sh

BASE_DIR=$(dirname $(readlink -f "$0"))
if [ "$1" != "test" ]
then
    psql -h localhost -U videoguayPracticar -d videoguayPracticar < $BASE_DIR/videoguayPracticar.sql
fi
psql -h localhost -U videoguayPracticar -d videoguayPracticar_test < $BASE_DIR/videoguayPracticar.sql
