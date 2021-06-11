FROM node:14.17.0

RUN apt-get update && apt-get install -y cron logrotate curl

COPY ./log-rotate /etc/logrotate.d/jobs

ENV WORKDIR=/usr/src/app
WORKDIR $WORKDIR

RUN touch /etc/cron.d/jobs
RUN chmod 0644 /etc/cron.d/jobs
RUN touch /var/log/cron.log

COPY ./setup.sh /tmp/setup.sh
RUN chmod +x /tmp/setup.sh

CMD ["/tmp/setup.sh"]
