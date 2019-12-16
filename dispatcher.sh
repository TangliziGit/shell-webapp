if test ! -p .pipe; then
    mkfifo .pipe
fi

i=1
while [ $i -lt 5 ]; do
    {
        printf "HTTP/1.0 200 OK\r\n"
        while read line; do
            req="${req}${line}"
            if [[ $(expr length "$line") -lt 2 ]]; then
                break;
            fi
        done < .pipe;

        resp="$(handler/header.sh "$req")"
        printf "Content-Length: %d\r\n\r\n" "$(echo -n $resp | wc -c)"
        printf "$resp"
    } | sudo nc -clvp 80 > .pipe

    i=$(( $i+1 ))
done

