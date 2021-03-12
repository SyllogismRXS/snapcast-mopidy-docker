# snapcast-mopidy-docker
Dockerfiles and instructions for setting up a snapcast / mopidy system at home.

## Build for multiple architectures

Setup for buildx:

    $ docker run --privileged --rm docker/binfmt:a7996909642ee92942dcd6cff44b9b95f08dad64

### Mopidy

    $ cd ./mopidy
    $ docker buildx build --push \
        --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
        --tag syllogismrxs/mopidy:latest .

### snapcast-server

    $ cd snapcast-server
    $ docker buildx build --push \
        --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
        --tag syllogismrxs/snapcast-server:latest .

### snapcast-client

    $ cd snapcast-client
    $ docker buildx build --push \
        --platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
        --tag syllogismrxs/snapcast-client:latest .
