stat=([200]="OK" \
    [302]="Found" \
    [404]="Not Found" [405]="Method Not Allowed"\
    [500]="Internal Server Error")

printf "HTTP/1.0 $1 ${stat[$1]}"
