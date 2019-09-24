FROM alpine:3.10
LABEL maintainer="Alexander Kiselev <a@kslv.me>"

RUN apk add --no-cache \
  samba-server \
  tzdata \
  && rm -rf /var/cache/apk/* \
  && mkdir /tm \
  && chown nobody:nogroup /tm \
  && chmod 770 /tm

COPY smb.conf /etc/samba/smb.conf

VOLUME ["/tm"]

EXPOSE 445/tcp

ENTRYPOINT ["smbd", "--foreground", "--no-process-group", "--log-stdout"]
