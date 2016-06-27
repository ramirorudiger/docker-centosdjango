FROM centos:6.6
RUN yum install -y \
 	tar \ 
	gcc \
	wget \
	openssl-devel \
	sqlite-devel

RUN cd /usr/src
RUN wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
RUN tar xzf  Python-2.7.10.tgz && cd Python-2.7.10 && ./configure && make altinstall
RUN wget https://bootstrap.pypa.io/ez_setup.py && python2.7 ez_setup.py --insecure \
	&& easy_install-2.7 pip \
	&& pip2.7 install virtualenv
WORKDIR "/root"

RUN virtualenv venv \
	&& source venv/bin/activate \
	&& pip2.7 install django 
COPY run.sh /root/
RUN  chmod 755 run.sh
EXPOSE 8000

ENTRYPOINT ["./run.sh"]
