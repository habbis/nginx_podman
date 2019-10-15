FROM centos:8
LABEL maintainer Eirik Habbestad <habbis@medmail.ch>
RUN yum install -y epel-release \
	nginx \
	wget \
	sudo
COPY sudoers /etc/
COPY certbot-auto /usr/local/bin/
RUN chown root:root /usr/local/bin/certbot-auto \
	 && chmod 755 /usr/local/bin/certbot-auto \
	 && chmod 440 /etc/sudoers \
	 && useradd -m -s /bin/bash user \
	 && usermod -a -G wheel user
USER user
