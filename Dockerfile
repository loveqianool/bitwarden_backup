FROM alpine
ENV TZ UTC
ENV DATA_FOLDER /data
ENV REMOTE gd
ENV PASSWORD 123123
ENV XDG_CONFIG_HOME=/config
WORKDIR /data

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN apk add --no-cache zip tzdata sqlite ca-certificates fuse && \
echo "user_allow_other" >> /etc/fuse.conf && \
wget https://beta.rclone.org/rclone-beta-latest-linux-amd64.zip && \
unzip rclone-beta-latest-linux-amd64.zip && \
mv rclone-*/rclone /usr/local/bin && \
rm -rf rclone-* && \
chmod +x /usr/local/bin/rclone && \
chmod +x /usr/local/bin/entrypoint.sh

#ENTRYPOINT [ "/bin/sh" ]
CMD [ "sh", "-c", "entrypoint.sh" ]
