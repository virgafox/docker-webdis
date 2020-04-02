# docker-webdis
External webdis in docker container. This is only the webdis server, you need to specify an existing redis host via env variables.

Env variables available:
- REDIS_HOST
- REDIS_PORT
- REDIS_AUTH
- HTTP_HOST
- HTTP_PORT
- THREADS
- POOL_SIZE
- WEBSOCKETS
- DATABASE

See `entrypoint.sh` to all the configurable details.
