FROM kali/kali:base
MAINTAINER dotato
# Metadata params
ARG BUILD_DATE
ARG VERSION

# Metadata Labels
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.name='Kali Linux Base' \
      org.label-schema.description='modified kali linux image' 

RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" > /etc/apt/sources.list && \
    echo "deb-src http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
ENV DEBIAN_FRONTEND noninteractive
RUN set -x \
    && apt-get -yqq update \
    && apt-get -yqq dist-upgrade \
    && apt-get clean 

# base packages for kali build
RUN apt-get update && apt-get install -y \
  less \
  git \
  vim 

# Set starting dir
WORKDIR /~

# Set profile
RUN echo 'alias qfind="find . -name "' >> ~/.bashrc \
	&& echo 'alias ll="ls -larth"' >> ~/.bashrc \
	&& echo 'alias cic="set completion-ignore-case On"' >> ~/.bashrc \
	&& echo 'alias vi="vim"' >> ~/.bashrc \
	&& echo 'alias top="htop"' >> ~/.bashrc \
	&& echo 'export PS1="_____________________________________________________________________________________________________________________________________\n| \w @ \h (\u) \n| => "' >> ~/.bashrc\
	&& echo 'export PS2="| => "' >> ~/.bashrc

# Load shell
CMD ["bash"]