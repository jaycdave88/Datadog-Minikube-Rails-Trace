FROM alpine:3.5

COPY cat-etc-hosts.sh .

RUN chmod u+x cat-etc-hosts.sh

CMD ["./cat-etc-hosts.sh"]
