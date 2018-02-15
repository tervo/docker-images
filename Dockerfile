FROM ufoym/deepo

RUN mkdir /a
WORKDIR /a

RUN echo "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.lits
RUN apt-get update
RUN apt-get install -y python-tk wget graphviz libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-gdal
RUN pip install matplotlib keras pydot graphviz keras-vis opencv-python unicodecsv pyproj requests imbalanced-learn
RUN wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && bash Miniconda2-latest-Linux-x86_64.sh -b
RUN /root/miniconda2/bin/conda install theano pygpu mkl-service
ENV PYTHONPATH=/root/miniconda2/lib/python2.7/site-packages
