FROM centos:7.1.1503 
MAINTAINER corey@logicminds.biz 
RUN echo "root:Docker!" | chpasswd
RUN mkdir -p /tmp/bootstrap
COPY scripts/puppet-bootstrap/centos_7_x.sh /tmp/bootstrap/centos_7_x.sh 
RUN bash /tmp/bootstrap/centos_7_x.sh
USER puppet
COPY scripts/puppet-bootstrap/Gemfile /home/puppet/
ENV PUPPET_VERSION="3.7.5"
ENV PATH=/home/puppet/bin:$PATH
RUN cd /home/puppet && bundle install
