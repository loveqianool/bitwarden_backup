FROM alpine
ENV TZ UTC
ENV DATA_FOLDER /data
ENV REMOTE gd
ENV PASSWORD 123123
RUN wget https://git-release.sakurasou.life/rclone/rclone/-linux-amd64.zip -O /tmp/rclone.zip && \
unzip /tmp/rclone.zip rclone -d /usr/local/bin
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apk add --no-cache zip tzdata sqlite && \
chmod +x /usr/local/bin/entrypoint.sh

#ENTRYPOINT [ "sh", "-c", "entrypoint.sh" ]
CMD [ "sh", "-c", "entrypoint.sh" ]
