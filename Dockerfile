FROM centos:latest

RUN yum -y update;
RUN yum -y clean all;

#SET UP THE ENVIRONNEMENT
RUN yum install -y  wget dialog curl sudo lsof vim telnet nano openssh-server openssh-clients bzip2 passwd tar bc git unzip
#INSTALL JAVA 1.8
RUN yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel 

#CREATE USER
RUN useradd guest -u 1000
RUN echo guest | passwd guest --stdin

#INSTALL PYTHON 2.7 
RUN yum install -y python27

ENV HOME /home/guest
WORKDIR $HOME

ENV SPARK_HOME $HOME/spark

#INSTALL CASSANDRA
RUN wget https://mirrors.ircam.fr/pub/apache/cassandra/3.11.9/apache-cassandra-3.11.9-bin.tar.gz
RUN tar xvzf apache-cassandra-3.11.9-bin.tar.gz
RUN mv apache-cassandra-3.11.9 cassandra
RUN rm apache-cassandra-3.11.9-bin.tar.gz 


# SET ENVIRONNEMENT ALIASES 
ADD setenv.sh /home/guest/setenv.sh
RUN chown guest:guest setenv.sh
RUN echo . ./setenv.sh >> .bashrc
# SET ENVIRONNEMENT VARIABLES
ENV PATH $HOME/cassandra/bin:$PATH

# INITIALIZE CASSANDRA
ADD init_cassandra.cql /home/guest/init_cassandra.cql
RUN chmod 755 init_cassandra.cql

# ADD THE START UP SCRIPT
ADD startup_script.sh /usr/local/bin/startup_script.sh
RUN chmod +x /usr/local/bin/startup_script.sh

COPY cassandra.yaml /home/guest/cassandra/conf/cassandra.yaml

EXPOSE 9042
# RUN THE STARTUP SCRIPT
CMD [ "startup_script.sh" ]


