# indico-docker

Updated Docker config from: [pferreir/indico-docker](https://github.com/pferreir/indico-docker)

Changes:
- Wait for postgress to be up before attempting database init
- Use UWSGI with nginx and varnish
- TeX support

```
$ docker-compose up
```
