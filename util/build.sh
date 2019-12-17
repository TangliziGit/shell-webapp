header="$1\r\n"
if [ "$2" != "" ]; then
    header="$(printf "$1\r\nContent-Length: %d" "$(echo -n $2 | wc -c)")"
fi

printf "$header\r\n\r\n$2"
