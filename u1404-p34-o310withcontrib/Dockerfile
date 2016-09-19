FROM congying/docker-ubuntu-python:u1404-p34

MAINTAINER Congying <congying1112@gmail.com>

RUN apt-get install -y unzip

RUN cd /tmp && wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip && unzip opencv.zip
RUN cd /tmp && wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.1.0.zip && unzip opencv_contrib.zip

RUN apt-get install -y \
build-essential \
cmake \
libgtk2.0-dev \
pkg-config \
libavcodec-dev \
libavformat-dev \
libswscale-dev \
libjpeg8-dev \
libtiff4-dev \
libjasper-dev \
libpng12-dev \
libavcodec-dev \
libavformat-dev \
libswscale-dev \
libv4l-dev \
libatlas-base-dev


RUN unlink /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN pip install numpy

RUN cd /tmp/opencv-3.1.0 \
&& mkdir build \
&& cd build \
&& cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_C_EXAMPLES=OFF \
-D INSTALL_PYTHON_EXAMPLES=ON \
-D OPENCV_EXTRA_MODULES_PATH=/tmp/opencv_contrib-3.1.0/modules \
-D BUILD_EXAMPLES=ON .. \
&& make -j4 \
&& make install \
&& ldconfig


RUN cd /usr/local/lib/python3.4/dist-packages/ && ln -s cv2.cpython-34m.so cv2.so

RUN rm -rf /tmp/*