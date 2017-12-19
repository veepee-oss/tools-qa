FROM maven:3.5.2-jdk-8-alpine
LABEL authors=PrivaliaQATeam

#============================================
# Networking tools
#============================================
RUN apk add --no-cache vim iputils openssh-client

COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY run.sh /opt/bin/run.sh

ENTRYPOINT ["/opt/bin/run.sh"]
