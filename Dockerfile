FROM python:3.9.6-slim

RUN apt-get install -y \
        git \
        curl \
        xz-utils \
        file \
        mecab \
        libmecab-dev \
        mecab-ipadic-utf8
RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git
RUN cd mecab-ipadic-neologd && \
    ./bin/install-mecab-ipadic-neologd -n -y -p /var/lib/mecab/dic/mecab-ipadic-neologd ; exit 0
RUN sed -i s/dicdir/\;dicdir/ /etc/mecabrc
RUN echo "dicdir = /var/lib/mecab/dic/mecab-ipadic-neologd" >> /etc/mecabrc
ENV MECABRC=/etc/mecabrc
RUN rm -rf /mecab-ipadic-neologd
RUN cp /etc/mecabrc /usr/local/etc/mecabrc
