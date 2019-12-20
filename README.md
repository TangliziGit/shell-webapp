# shell-webapp
Using shell only to build a web application, based on netcat. 

## Deploy via docker  
```bash
docker pull tanglizi/shell-webapp  
docker run --name shell-webapp -p 8080:8080 -d tanglizi/shell-webapp
```

## Deploy via source code
```bash
git clone https://github.com/TangliziGit/shell-webapp.git
cd shell-webapp
chmod +x dispatcher handler/* render/* util/*
```

## Run
To run the server:
```bash
./dispatcher
```

To run a client, you can open a browser and just go `http://localhost`.  
Or you can `curl localhost`

## Unit Test
Requires [bats](https://github.com/bats-core/bats-core) to process unit testing.
```bash
bats test/*.bats
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
- [x] docker
- [x] CI/CD on shell scripts, and Dockerfile lint & build
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
