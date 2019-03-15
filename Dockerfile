FROM ufoym/deepo:cpu

RUN mkdir /a
WORKDIR /a

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_CTYPE=C.UTF-8

# Basic stuff
RUN echo "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.lits
RUN apt-get update
RUN apt-get install -y python3-tk wget graphviz libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-gdal curl

# Google sdk
RUN export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
    echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    apt-get update -y && apt-get install google-cloud-sdk google-cloud-sdk-app-engine-python google-cloud-sdk-app-engine-python-extras google-cloud-sdk-datalab -y

# PIP stuff
RUN pip install --upgrade pydot graphviz keras-vis opencv-python unicodecsv pyproj requests imbalanced-learn boto boto3 psycopg2-binary unicodecsv pyproj requests google-cloud tensorflow google-api-python-client google-auth-httplib2 google-cloud-bigquery[pandas] pyarrow google-cloud-storage scipy tensorflow-probability

# eccodes
# RUN cd /tmp && mkdir eccodes && cd eccodes && wget https://software.ecmwf.int/wiki/download/attachments/45757960/eccodes-2.7.0-Source.tar.gz?api=v2 -O e.tar.gz && mkdir es && tar -C /tmp/eccodes -xzvf e.tar.gz && mkdir build && cd build && ls -la /tmp/eccodes/eccodes-2.7.0-Source && cmake -DCMAKE_INSTALL_PREFIX=/usr/local /tmp/eccodes/eccodes-2.7.0-Source && make && make install && rm -R /tmp/eccodes

# mlfdb
RUN mkdir /tmp/a && git clone https://github.com/fmidev/ml_feature_db.git /tmp/a && pip install /tmp/a/api && rm -rf /tmp/a

#RUN mkdir /tmp/a
#ADD api /tmp/a/api
#RUN pip install --upgrade /tmp/a/api && rm -rf /tmp/a

# ENV PYTHONPATH "/usr/lib/google-cloud-sdk:/usr/lib/google-cloud-sdk/lib:/usr/lib/google-cloud-sdk/lib/yaml"
