FROM alpine

RUN apk add bash curl python
# Install google cloud sdk (gcloud and gsutil used in backup.sh)
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

RUN mkdir /creds
RUN mkdir /volume
RUN mkdir /restore
RUN mkdir /scripts

ADD restore.sh /scripts/restore.sh
RUN chmod +x /scripts/restore.sh

CMD ["/scripts/restore.sh"]
