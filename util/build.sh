header="$(util/status.sh $1)"
if [ "$2" != "" ]; then
    header="$(printf "%s\r\nContent-Length: %d" "$header" "$(echo -n $2 | wc -c)")"
fi

printf "$header\r\n\r\n$2"
