FROM harshpreets63/cutie:sweet

WORKDIR /usr/src/app

RUN git clone https://github.com/rootuttu/harsh

RUN apt update && upgrade

RUN apt install sudo

RUN echo "Sudo :- it's ON"

RUN sudo apt install wget curl

COPY . .

RUN set -ex \

    && chmod 777 /usr/src/app \ 
    
    && git clone https://github.com/rootuttu/harsh \
    
    && cp .netrc /root/.netrc \

    && chmod 600 /usr/src/app/.netrc \

    && cp extract pextract /usr/local/bin \

    && chmod +x aria.sh /usr/local/bin/extract /usr/local/bin/pextract

RUN pip3 install -U pyrogram

CMD ["bash", "start.sh"]
