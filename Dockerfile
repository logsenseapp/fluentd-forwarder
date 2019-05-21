FROM fluent/fluentd:stable

ENV FLUENTD_CONF=logsense.conf

COPY logsense.conf /fluentd/etc/logsense.conf
