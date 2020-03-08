FROM rclone/rclone
ENV TZ UTC
ENV DATA_FOLDER /data
ENV REMOTE gd
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apk add --no-cache tzdata sqlite && \
chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT [ "sh", "-c", "entrypoint.sh" ]
