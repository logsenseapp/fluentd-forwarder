FROM fluent/fluentd:stable

ENV FLUENTD_CONF=logsense.conf

ENV LOGSENSE_HOST=logs.logsense.com
ENV LOGSENSE_PORT=32714

COPY logsense.conf /fluentd/etc/
