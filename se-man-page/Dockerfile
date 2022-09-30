FROM centos:centos7

RUN  yum -y install cpanm gcc perl perl-App-cpanminus perl-Config-Tiny &&  yum clean all
RUN yum -y install ghostscript
RUN yum -y install enscript
RUN yum -y localinstall https://www.linuxglobal.com/static/blog/pdftk-2.02-1.el7.x86_64.rpm
RUN yum -y install texlive-*
RUN yum -y install ImageMagick
RUN yum -y install git
RUN yum -y install ca-certificates

RUN ["cpanm", "Carp", "Test::Memory::Cycle", "Devel::Cycle", "Font::TTF", "Test::Exception", "Sub::Uplevel", "PDF::API2", "PDF::Table", "Log::Log4perl"]

RUN mkdir /root/.ssh && chmod 0700 /root/.ssh
RUN ssh-keyscan eos2git.cec.lab.emc.com >> /root/.ssh/known_hosts

COPY ./certs/ /usr/local/share/ca-certificates/
RUN update-ca-trust


COPY . /home/jenkins/workspace/se-man-page-docker
WORKDIR /home/jenkins/workspace/se-man-page-docker/utils/man_page_generator
RUN perl man_page_gen.pl /home/jenkins/workspace/se-man-page-docker
