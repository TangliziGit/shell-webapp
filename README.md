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

## Todo

- [x] web server
- [x] page rendering
- [x] basic logging
- [x] routing
- [ ] forward and redirect
- [x] custom HTTP header
- [x] HTTP status table
- [ ] basic secure

## Note
Notable knowledge about the implementation process is placed in `notes.md`.

## License

> MIT License
> 
> Copyright (c) 2019 Chunxu Zhang
> 
