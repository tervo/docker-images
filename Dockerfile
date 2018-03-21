FROM ufoym/deepo:cpu

RUN mkdir /a
WORKDIR /a

RUN echo "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.lits
RUN apt-get update
RUN apt-get install -y python-tk wget graphviz libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-gdal
RUN pip install pydot graphviz keras-vis opencv-python unicodecsv pyproj requests imbalanced-learn boto boto3 psycopg2-binary unicodecsv pyproj requests 
RUN ls -la
RUN cd /tmp && mkdir eccodes && cd eccodes
RUN wget https://software.ecmwf.int/wiki/download/attachments/45757960/eccodes-2.7.0-Source.tar.gz?api=v2 -O e.tar.gz
RUN mkdir es && tar -C /tmp/eccodes -xzvf e.tar.gz
RUN mkdir build
RUN cd build
RUN ls -la /tmp/eccodes/eccodes-2.7.0-Source
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr/local /tmp/eccodes/eccodes-2.7.0-Source
RUN make
# uncomment "make check" if you want test library with data (test require download all test data and it takes a long time...) 
#make check
RUN make install
RUN rm -R /tmp/eccodes

RUN mkdir /tmp/a
RUN git clone https://github.com/fmidev/ml_feature_db.git /tmp/a
RUN pip install /tmp/a/api

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE=C.UTF-8
