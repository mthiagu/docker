FROM centos:centos7

RUN  yum -y install cpanm gcc perl perl-App-cpanminus perl-Config-Tiny &&  yum clean all
RUN yum -y install ghostscript
RUN yum -y install enscript
RUN yum -y localinstall https:
RUN yum -y install texlive-*
RUN yum -y install ImageMagick

RUN ["cpanm", "Carp", "Test::Memory::Cycle", "Devel::Cycle", "Font::TTF", "Test::Exception", "Sub::Uplevel", "PDF::API2", "PDF::Table", "Log::Log4perl"]

COPY . /home/jenkins/workspace/se-man-page-docker
WORKDIR /home/jenkins/workspace/se-man-page-docker/utils/man_page_generator/
