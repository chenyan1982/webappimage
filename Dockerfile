FROM ubuntu-upstart
MAINTAINER Sky.Y.Chen <chenyanhasmail@gmail.com>
VOLUME ["/tmp/data"]
RUN apt-get update
RUN cd /opt && wget https://nodejs.org/dist/v0.12.7/node-v0.12.7-linux-x64.tar.gz && tar -xzf node-v0.12.7-linux-x64.tar.gz && rm -f node-v0.12.7-linux-x64.tar.gz && mv node-v0.12.7-linux-x64 node
RUN cd /usr/local/bin && ln -s /opt/node/bin/* .
RUN npm install -g generator-keystone
RUN cd /tmp/data && mkdir my-test-project && cd my-test-project && echo prefix = ~/.node >> ~/.npmrc && export PATH=$HOME/.node/bin:$PATH && yo keystone
WORKDIR /src 
CMD ["/bin/bash"]