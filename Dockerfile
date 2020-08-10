FROM alpine
ENV TZ UTC
ENV DATA_FOLDER /data
ENV REMOTE gd
ENV PASSWORD 123123
ENV rclone_version 1.52.3

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apk add --no-cache zip tzdata sqlite && \
wget https://github.com/rclone/rclone/releases/download/v$rclone_version/rclone-v$rclone_version-linux-amd64.zip && \
unzip rclone-v$rclone_version-linux-amd64.zip && \
mv rclone-v$rclone_version-linux-amd64/rclone /usr/local/bin && \
rm -rf rclone-v$rclone_version-linux-* && \
chmod +x /usr/local/bin/rclone && \
chmod +x /usr/local/bin/entrypoint.sh

#ENTRYPOINT [ "/bin/sh" ]
CMD [ "sh", "-c", "entrypoint.sh" ]
