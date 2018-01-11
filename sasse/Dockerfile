# Initial version of SASSE docker file. For now, tested only for creating confusion matrix. 
FROM tensorflow/tensorflow 

RUN mkdir /a
WORKDIR /a
COPY apt.conf /etc/apt/apt.conf
RUN echo "deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu xenial main" >> /etc/apt/sources.lits
RUN apt-get update
RUN apt-get --allow-unauthenticated install -y python-tk wget graphviz libtiff5-dev libjpeg8-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-gdal
RUN pip install matplotlib keras pydot graphviz keras-vis opencv-python psycopg2 unicodecsv SQLAlchemy
RUN pip install GeoAlchemy2
RUN pip install pyproj 
RUN pip install requests

# ADD requirements.txt .
# RUN pip install --ignore-installed -r requirements.txt

# ENV PYTHONPATH=/root/miniconda2/lib/python2.7/site-packages

# RUN rm -rf /root/.cache/matplotlib

# docker run --rm -v /smartdev/run/products/sasse/bin:/a sasse python xx.py
