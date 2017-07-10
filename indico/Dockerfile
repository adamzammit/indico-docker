FROM python:2

ENV INDICO_VIRTUALENV="/opt/indico/env/bin"
ENV INDICO_CONFIG=/opt/indico/etc/indico.conf

ARG pip="${INDICO_VIRTUALENV}/pip"

RUN useradd indico -g users -u 1000

RUN apt-get update && apt-get install -y gcc libxml2-dev libxslt-dev postgresql postgresql-server-dev-all texlive-xetex && rm -rf /var/lib/apt/lists/* 

RUN mkdir /opt/indico && \
    mkdir -p /opt/indico/etc && \
    mkdir -p /opt/indico/tmp && \
    mkdir -p /opt/indico/log && \
    mkdir -p /opt/indico/assets && \
    mkdir -p /opt/indico/cache && \
    mkdir -p /opt/indico/archive


RUN chown -R indico:users /opt/indico


RUN mkdir /home/indico
RUN chown -R indico:users /home/indico

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

USER indico
RUN virtualenv /opt/indico/env

RUN ${pip} install pgcli

RUN ${pip} install --upgrade pip


RUN ${pip} install https://pypi.python.org/packages/26/e4/9aafeddba9d28a81a8b40d85cdee9d674a93fe5040825ef1bb03287ea768/indico_fonts-1.1-py2.py3-none-any.whl#md5=eb8b908fdc2b25799cbc50ed380212ee
RUN ${pip} install https://pypi.python.org/packages/59/19/217f39bae3b5fa71690b83e0a1e66ab2929ae37b37fff67cd2ee4a13f556/indico-1.9.11.dev10-py2-none-any.whl
RUN ${pip} install uwsgi

RUN ${INDICO_VIRTUALENV}/indico setup create_symlinks /opt/indico
RUN ${INDICO_VIRTUALENV}/indico setup create_configs /opt/indico/etc

COPY indico.ini /opt/indico/indico.ini

RUN echo ". $INDICO_VIRTUALENV/activate" > ~/.bashrc


VOLUME /opt/indico

ENTRYPOINT /entrypoint.sh
