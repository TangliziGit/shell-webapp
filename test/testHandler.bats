sample="test/sample"
header="$(cat $sample/.header.txt)"

@test "test handler/index" {
    req="GET /index HTTP/1.0\r\n${header}"
    run handler/index.sh "$req"
    output="2"
    [ "$output" = "$(cat $sample/index.txt)" ]
}

@test "test handler/header" {
    req="GET /header HTTP/1.0\r\n${header}"
    run handler/header.sh "$req"
    [ "$output" = "$(cat $sample/header.txt)" ]
}

@test "test handler/forward" {
    req="GET /forward HTTP/1.0\r\n${header}"
    run handler/forward.sh "$req"
    [ "$output" = "$(cat $sample/forward.txt)" ]
}

@test "test handler/redirect" {
    req="GET /redirect HTTP/1.0\r\n${header}"
    run handler/redirect.sh "$req"
    [ "$output" = "$(cat $sample/redirect.txt)" ]
}

