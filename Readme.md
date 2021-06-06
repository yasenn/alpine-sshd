# Alpine ssh server

`Dockerfile` with `openssh` and your pubkey as `authorized_keys`

## About

This `Dockerfile` builds an image with embedded pubkey from your `$HOME` directory.
Pubkey filename declared in `config.env`:

```
SSH_PUBKEY_FILE=~/.ssh/id_rsa.pub
```

## Quickstart

One-line start with `make up`:

```
git clone https://github.com/yasenn/alpine-sshd
cd alpine-sshd
make up
```

## Demo

[![asciicast](https://asciinema.org/a/pb8YcxdPGo4mGtQVQmHQutQ6L.png)](https://asciinema.org/a/pb8YcxdPGo4mGtQVQmHQutQ6L)

  
## Usage/Examples

```
$ make
> help                           This help.
> build                          Build the container
> build-nc                       Build the container without caching
> run                            Run container on port configured in `config.env`
> up                             Build & Run container on port configured in `config.env`
> stop                           Stop a running container
> test                           Checks if sshd in container works correctly
```

  
## Running Tests

To run tests, run the following command

```bash
  make stop
  make build
  make run
  make test
```

  
## Acknowledgements

 - [danielguerra69/alpine-sshd: alpine ssh server](https://github.com/danielguerra69/alpine-sshd)
 - [Simple Makefile to build, run, tag and publish a docker containier to AWS-ECR](https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db)
 - [Self-Documented Makefile](https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)

  
## License

[MIT](https://choosealicense.com/licenses/mit/)
