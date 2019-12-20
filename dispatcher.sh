#!/bin/bash

if test ! -p .pipe; then
    mkfifo .pipe
fi

trap break INT
while true; do
    {
        read req < .pipe
        uri=$(echo $req | grep -o '/[^ ]*' | head -1)
        if [ "$uri" == "/" ]; then
            uri="/index"
        fi

        while read -t 0.5 line; do
            req="${req}${line}"
        done < .pipe

        if test -f "handler$uri.sh"; then
            resp="$(handler$uri.sh "$req")"
        elif test -f "resource$uri"; then
            resp="$(cat resource$uri)"
            resp="$(util/build 200 '' "$resp")"
        else
            resp="$(cat resource/404.html)"
            resp="$(util/build 404 '' "$resp")"
        fi

        printf "$resp"

        util/log "$req" "req.log"
        util/log "$resp" "resp.log"

    } | nc -lvp $1 > .pipe
done
