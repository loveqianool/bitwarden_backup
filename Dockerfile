FROM rclone/rclone
ENV TZ UTC
ENV DATA_FOLDER /data
ENV REMOTE gd
ENV PASSWORD 123123
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apk add --no-cache zip tzdata sqlite && \
chmod +x /usr/local/bin/entrypoint.sh

#ENTRYPOINT [ "sh", "-c", "entrypoint.sh" ]
CMD [ "sh", "-c", "entrypoint.sh" ]
