head="$(sed -u 's/\//\\\//g' resource/head)"
body="$(sed -u 's/\//\\\//g' resource/body)"
content="$(sed -u "s/##head##/$head/g;s/##body##/$body/g" resource/template.html)"
printf "$content"
