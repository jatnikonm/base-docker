FROM python:2.7.11

ENV PYTHONUNBUFFERED=1\
    PIP_REQUIRE_VIRTUALENV=false\
    PATH=/virtualenv/bin:/root/.local/bin:$PATH\
    PROCFILE_PATH=/app/Procfile

COPY stack /stack/base
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /stack/base/install.sh

RUN virtualenv --no-site-packages /virtualenv

ENTRYPOINT ["/tini", "-g", "--"]

ADD Procfile /app/Procfile
CMD ["start", "web"]
