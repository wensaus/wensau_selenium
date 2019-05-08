FROM ubuntu

MAINTAINER zhangchaoultra@163.com

RUN mkdir /home/admin && \
    mkdir /opt/Chrome && \
    mkdir -p /usr/share/fonts/chinese/TrueType/ &&\
    apt-get update && apt-get install -y wget &&\
    apt-get install -y vim &&\
    apt-get install -y language-pack-zh-hans &&\
    apt-get install -y unzip &&\
    apt-get install -y fontconfig &&\
    apt-get install -y python3 &&\
    apt-get install -y python3-pip &&\
    wget http://fbi-fonts.oss-cn-shanghai.aliyuncs.com/msyh.ttf -O /home/admin/msyh.ttf &&\
    wget http://cdn.npm.taobao.org/dist/chromedriver/74.0.3729.6/chromedriver_linux64.zip -O /opt/Chrome/chromedriver_linux64.zip &&\
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /opt/Chrome/google-chrome-stable_current_amd64.deb &&\
    cp /home/admin/msyh.ttf /usr/share/fonts/chinese/TrueType/

WORKDIR /opt/Chrome/

RUN unzip chromedriver_linux64.zip &&\
    mv chromedriver /usr/bin &&\
    dpkg -i google-chrome*.deb || echo 'ok' &&\
    apt-get install -y -f &&\
    apt-get install -y google-chrome-stable &&\
    pip3 install selenium &&\
    pip3 install oss2 &&\
    fc-cache -fv
