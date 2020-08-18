FROM python:3.8-alpine

LABEL repository="https://github.com/menzew/daction"
LABEL homepage="https://github.com/actions"

RUN apk add --no-cache git less
RUN pip install gitdb2==3.0.0 truffleHog==2.1.11

COPY entrypoint.sh /entrypoint.sh
COPY regexes.json /regexes.json

ENTRYPOINT ["sh", "/entrypoint.sh"]
