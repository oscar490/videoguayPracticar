#!/bin/sh

if [ "$1" = "travis" ]
then
    psql -U postgres -c "CREATE DATABASE videoguayPracticar_test;"
    psql -U postgres -c "CREATE USER videoguayPracticar PASSWORD 'videoguayPracticar' SUPERUSER;"
else
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists videoguayPracticar
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists videoguayPracticar_test
    [ "$1" != "test" ] && sudo -u postgres dropuser --if-exists videoguayPracticar
    sudo -u postgres psql -c "CREATE USER videoguayPracticar PASSWORD 'videoguayPracticar' SUPERUSER;"
    [ "$1" != "test" ] && sudo -u postgres createdb -O videoguayPracticar videoguayPracticar
    sudo -u postgres createdb -O videoguayPracticar videoguayPracticar_test
    LINE="localhost:5432:*:videoguayPracticar:videoguayPracticar"
    FILE=~/.pgpass
    if [ ! -f $FILE ]
    then
        touch $FILE
        chmod 600 $FILE
    fi
    if ! grep -qsF "$LINE" $FILE
    then
        echo "$LINE" >> $FILE
    fi
fi
