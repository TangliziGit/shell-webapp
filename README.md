# shell-webapp
Using shell only to build a web application, based on netcat. 

## Deploy 
```bash
chmod +x dispatcher.sh handler/* render/* util/*
```

## Run
To run the server:
```bash
./dispatcher.sh
```

To run a client, you can open a browser and just go `http://localhost`.  
Or you can `curl localhost`

## Unit Test
Requires [bats](https://github.com/bats-core/bats-core) to process unit testing.
```bash
bats test/*.sh
```

## Todo

- [x] web server
- [x] page rendering
- [x] basic logging
- [x] routing
- [x] forward and redirect
- [x] custom HTTP header
- [x] HTTP status table
- [x] unit testing for handlers
- [ ] CI/CD
- [ ] README: explain how it works
- [ ] learn how to write shell
- [ ] basic secure

## Note
Notable knowledge about the implementation process is placed in `notes.md`.

## License

> MIT License
> 
> Copyright (c) 2019 Chunxu Zhang
> 
