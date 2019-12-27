# shell-webapp
Using shell only to build a web application, based on netcat and nginx, FastCGI. 

## Deploy via docker  
- netcat version:  
    ```bash
    docker pull tanglizi/shell-webapp  
    docker run --name shell-webapp -p 8080:8080 -d tanglizi/shell-webapp
    ```
- nginx version:  
    `to be continue`

## Deploy via source code
- netcat version:  
    ```bash
    git clone https://github.com/TangliziGit/shell-webapp.git
    cd shell-webapp
    chmod +x dispatcher.sh handler/* render/* util/*
    ```
- nginx version:  
    ```bash
    git clone https://github.com/TangliziGit/shell-webapp.git
    cd shell-webapp
    # modify your nginx.conf
    cp nginx.conf /etc/nginx/nginx.conf
    ```

## Run
To run the server, netcat version:  
```bash
./dispatcher.sh 8080
```
nginx version:  
```bash 
systemctl restart nginx
systemctl restart fcgiwrap
```

To run a client, you can open a browser and just go `http://localhost:8080`.  
Or you can `curl localhost:8080`

## Unit Test
Requires [bats](https://github.com/bats-core/bats-core) to process unit testing.
```bash
bats test/*.bats
```

## Feature

- [x] page rendering
- [x] basic logging
- [x] routing
- [x] forward and redirect
- [x] custom HTTP header
- [x] unit testing
- [x] docker
- [x] Github CI/CD on shell scripts and Dockerfile lint & build
- [x] nginx

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
- [x] Github CI/CD on shell scripts and Dockerfile lint & build
- [x] nginx
- [] update nginx docker
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
