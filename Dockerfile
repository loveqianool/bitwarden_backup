FROM rclone/rclone
ENV TZ UTC
ENV DATA_FOLDER /data
ENV REMOTE gd
RUN apk add --no-cache tzdata sqlite
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "sh", "-c", "entrypoint.sh" ]
