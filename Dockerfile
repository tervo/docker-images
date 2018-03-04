FROM ufoym/deepo:cpu

RUN mkdir /a
WORKDIR /a

RUN echo "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.lits
RUN apt-get update
RUN apt-get install -y python-tk wget graphviz libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-gdal #python-gdal3
RUN pip install pydot graphviz keras-vis opencv-python unicodecsv pyproj requests imbalanced-learn boto boto3 psycopg2-binary unicodecsv pyproj requests

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en
# ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE=C.UTF-8
