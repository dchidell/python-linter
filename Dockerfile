FROM python:alpine
COPY requirements.txt run-linter.sh ./
RUN chmod a+x run-linter.sh
RUN apk add --no-cache --virtual .build-deps build-base gcc \
    && pip install -r requirements.txt \
    && apk del .build-deps
WORKDIR /app
ENV LINE_LEN=120
CMD ["/bin/sh","-c","/run-linter.sh"]