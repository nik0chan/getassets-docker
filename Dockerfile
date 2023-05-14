FROM alpine:edge 

RUN apk add --no-cache \
    build-base libffi-dev \
    nodejs yarn tzdata \
    libxml2-dev libxslt-dev bash \
    chromium chromium-chromedriver python3 python3-dev py3-pip \
    git vim \ 
    sslscan

RUN pip3 install -U selenium 
RUN pip3 install dnspython requests webdriver_manager 
RUN git https://github.com/nik0chan/get_assets.git /get_assets

WORKDIR /get_assets

ENTRYPOINT [ "python3","/get_assets/get_assets.py" ]

