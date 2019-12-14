i=1
while [ $i -lt 3 ]; do
    content=$(printf "HTTP/1.1 200 OK\r\nContent-Length: %d\r\n\r\n%s" "$(printf "$(handler/index.sh)" | wc -c)" "$(handler/index.sh)")
    printf "$content" | sudo nc -clvp 80

    i=$(( $i+1 ))
done
