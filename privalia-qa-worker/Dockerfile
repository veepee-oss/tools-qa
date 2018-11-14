FROM ibmjava:8-sdk-alpine
LABEL authors=PrivaliaQATeam

#============================================
# Networking tools
#============================================
RUN apk add --no-cache curl tar bash vim iputils openssh-client

RUN adduser -D -u 994 jenkins

ARG MAVEN_VERSION=3.5.4
ARG USER_HOME_DIR="/home/jenkins"
ARG SHA=ce50b1c91364cb77efe3776f756a6d92b76d9038b0a0782f7d53acf1e997a14d
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${SHA}  /tmp/apache-maven.tar.gz" | sha256sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"

USER jenkins
RUN mkdir $USER_HOME_DIR/.m2
COPY mvn-entrypoint.sh /usr/local/bin/mvn-entrypoint.sh
COPY run.sh /opt/bin/run.sh
COPY settings-docker.xml /usr/share/maven/ref/
COPY settings.xml $USER_HOME_DIR/.m2/settings.xml


ENTRYPOINT ["/opt/bin/run.sh"]
CMD ["mvn"]
