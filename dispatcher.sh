function log() {
    printf "$1\n\n" | sed -u 's//\n/g' >> $2
}

if test ! -p .pipe; then
    mkfifo .pipe
fi

trap break INT
while true; do
    {
        while read line; do
            if [[ $req == "" ]]; then 
                uri=$(echo $line | grep -o '/[^ ]*' | head -1)
                if [ "$uri" == "/" ]; then
                    uri="/index"
                fi
            fi
            req="${req}${line}"
            if [[ $(expr length "$line") -lt 2 ]]; then
                break
            fi
        done < .pipe

        if test -f "handler$uri.sh"; then 
            resp="$(handler$uri.sh "$req")"
        elif test -f "resource$uri"; then
            resp="$(cat resource$uri)"
            resp="$(util/build.sh "HTTP/1.0 200 OK" "$resp")"
        else
            resp="$(cat resource/404.html)"
            resp="$(util/build.sh "HTTP/1.0 404 Not Found" "$resp")"
        fi

        printf "$resp"

        log "$req" "req.log"
        log "$resp" "resp.log"

    } | sudo nc -clvp 80 > .pipe
done

