FROM ubuntu:22.04

RUN mkdir /data

ENTRYPOINT [ "/bin/sh" ]

CMD [ "-c", "while true; do echo $(date) >> /data/file.txt; sleep 10; done;" ]
