# Docker Node Cron

Docker image that runs node scheduled tasks from OS native cron

## Usage with docker compose

```yml
  cronjobs:
    image: brunobertolini/node-cron:0.1.0
    environment:
      - CRONTAB_FILE=./crontab
    volumes:
      - ./app:/usr/src/app
```

By default, the working directory is set to `/usr/src/app`.
If you can change the working dir, needs to set up a env var called `WORKDIR` on your docker compose file.

Crontab file is not set as volume because we need change them to set env vars inside, so, to avoid change original file, you need pass as env var too.

### Crontab file example

```shell
* * * * * root node /usr/src/app/your_job_file.js >> /var/log/cron.log 2>&1
* * * * * root cd $WORKDIR && yarn your_job_command >> /var/log/cron.log 2>&1
```

## Logs

If you can see logs, or add to a volume, you can add: `./youlog:/var/logs` to yout volumes config.

## Credits

This project was storngly based on [node-cron](https://github.com/sanderdms/node-cron) from [cshtdd](https://github.com/cshtdd)