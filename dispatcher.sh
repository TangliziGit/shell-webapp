function log() {
    printf "$1\n\n" | sed -u 's//\n/g' >> $2
}

if test ! -p .pipe; then
    mkfifo .pipe
fi

i=1
while [ $i -lt 7 ]; do
    {
        while read line; do
            if [[ $req == "" ]]; then 
                uri=$(echo $line | grep -o '/[^ ]*' | head -1)
            fi
            req="${req}${line}"
            if [[ $(expr length "$line") -lt 2 ]]; then
                break
            fi
        done < .pipe

        if test -e "handler$uri.sh"; then 
            resp="$(handler$uri.sh "$req")"
        elif test -e "resource$uri"; then
            resp="$(cat resource$uri)"
        else
            resp="$(cat resource/404.html)"
        fi

        printf "HTTP/1.0 200 OK\r\n"
        printf "Content-Length: %d\r\n\r\n" "$(echo -n $resp | wc -c)"
        printf "$resp"

        log "$req" "req.log"
        log "$resp" "resp.log"

    } | sudo nc -clvp 80 > .pipe

    i=$(( $i+1 ))
done

