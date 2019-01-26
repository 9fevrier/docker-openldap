# 9fevrier/openldap:2.4.46-r0

FROM alpine:3.8 as builder
MAINTAINER 9 Février <contact@9fevrier.com>

RUN apk --no-cache add bash \
                       openldap \
                       openldap-backend-all \
											 openldap-overlay-all \
	  && mkdir -p /run/openldap \
		            /etc/openldap/slapd.d \
		&& mv /etc/openldap/slapd.ldif /etc/openldap/slapd.d/cn\=config.ldif


FROM scratch
MAINTAINER 9 Février <contact@9fevrier.com>

COPY --from=builder ["/", "/"]
COPY ["adds/opt/entry-point.sh", "/opt/"]
RUN chmod +x /opt/entry-point.sh

VOLUME ["/etc/openldap"]
EXPOSE 389
EXPOSE 636
ENTRYPOINT ["/opt/entry-point.sh"]
CMD []
