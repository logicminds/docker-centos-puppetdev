FROM centos:7.2.1511 
MAINTAINER corey@logicminds.biz
RUN echo "root:Docker!" | chpasswd
RUN mkdir -p /tmp/bootstrap
COPY scripts/puppet-bootstrap/centos_7_x.sh /tmp/bootstrap/centos_7_x.sh
RUN bash /tmp/bootstrap/centos_7_x.sh
USER puppet
COPY scripts/puppet-bootstrap/Gemfile /home/puppet/
<<<<<<< HEAD
ENV PUPPET_VERSION="4.3.1"
=======
ENV PUPPET_VERSION="4.2"
>>>>>>> setup for puppet 4.2
ENV PATH=/home/puppet/bin:$PATH
RUN cd /home/puppet && bundle install
