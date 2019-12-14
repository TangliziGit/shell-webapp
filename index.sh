head="$(sed -u 's/\//\\\//g' head)"
body="$(sed -u 's/\//\\\//g' body)"
content="$(sed -u "s/##head##/$head/g;s/##body##/$body/g" template.html)"
printf "$content"
