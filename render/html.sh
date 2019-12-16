name="resource/$1.html"
content="$(cat $name)"
for key in `grep -oP "(?<=##)\w+(?=##)" $name`; do
    value="$(sed "s/\//\\\\\//g" resource/$key.html)"
    value="$(printf "$value" | sed -e 'H;${x;s/\n/\\n/g;s/^\\n//;p;};d')"
    content="$(printf "$content" | sed "s/##$key##/$value/g")"
done

printf "$content"
