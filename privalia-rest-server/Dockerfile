FROM node:9.11.1
MAINTAINER Privalia QA Team

#============================================
# Install server using NPM
#============================================
RUN npm install -g json-server@0.14.0


#============================================
# Copy dependencies to 
#============================================
COPY db.json \
    entry_point.sh \
    /opt/bin/


EXPOSE 3000
ENTRYPOINT ["/opt/bin/entry_point.sh"]
CMD []