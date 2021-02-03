#!/bin/bash
echo "Starting node-cron"

cp /etc/cron.daily/logrotate /etc/cron.hourly/logrotate

env >> /etc/environment
echo "PATH=$PATH" >> /etc/cron.d/jobs
cat - $WORKDIR/$CRONTAB_FILE >> /etc/cron.d/jobs

echo "Running cron"
cron && tail -F /var/log/cron.log
