head="$(sed -u 's/\//\\\//g' resource/head.html)"
body="$(sed -u 's/\//\\\//g' resource/body.html)"
content="$(sed -u "s/##head##/$head/g;s/##body##/$body/g" resource/template.html)"
printf "$content"
