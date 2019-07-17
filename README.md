# BingoBuilder - Sinatra app running in Docker

## Dependencies

You will only need docker and docker-compose to run the application.

* docker (>= 17.12.0)
* docker-compose (>= 1.18)

## Installation

### Clone repository

```
git clone https://github.com/Yardboy/sinatra-docker.git
```

### Copy `*.example` files

```
cp .env.example .env
```

### Build all docker containers

```
bin/dev build
```

### Run the web app

```
bin/dev up
```

### Run web container and start bash shell

```
bin/dev bash
```

### Inside the shell, start the server

```
bin/dev server
```

### Run the rubocop tests

```
bin/dev rubocop
```
