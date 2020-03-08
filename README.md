# bitwarden_backup
```
docker run --rm --volumes-from=bitwarden --user 1111:users \
-v ~/.config/rclone:/config/rclone \
-e TZ="$(cat /etc/timezone)" \
-e DATA_FOLDER=/data \
-e REMOTE=gd \
loveqianool/bitwarden_backup
```
