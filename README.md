
# QuakeJS docker image

## Makefile usage
```sh
make build    # builds docker image
make create   # create docker container
make remove   # deletes docker container
make start    # start container
make stop     # stop container

make recreate # stop -> remove -> build -> create -> start

# Enjoy playing quake: http://0.0.0.0:8989/
```

## Docker usage
```sh
docker build -t quakejs .

docker run \
  -rm \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/Berlin \
  -p 8989:8080 \
  -p 27960:27960 \
  -v $(pwd)/config:/config \
  quakejs

# Enjoy playing quake: http://0.0.0.0:8989/
```