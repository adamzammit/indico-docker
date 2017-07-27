# indico-docker

Updated Docker config from: [pferreir/indico-docker](https://github.com/pferreir/indico-docker)

Changes:
- Wait for postgres to be up before attempting database init
- Use UWSGI with nginx and varnish
- TeX support
- SMTP mail support
- CAS Authentication support for Flask Multipass from [xaionaro/flask-multipass-cas](https://github.com/xaionaro/flask-multipass-cas)

If you want to use this script - please review the docker-compose.yml, indico/indico.conf and smtp/ files for specific config options
```
$ docker-compose up -d
```
