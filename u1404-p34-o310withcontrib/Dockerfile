FROM congying/docker-ubuntu-python:u1404-p34

MAINTAINER Congying <congying1112@gmail.com>

RUN apt-get install -y \
build-essential \
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
libatlas-base-dev \
unzip

RUN cd /tmp && wget -O cmake-3.6.2.tar.gz https://cmake.org/files/v3.6/cmake-3.6.2.tar.gz && tar -zxvf cmake-3.6.2.tar.gz
RUN cd /tmp/cmake-3.6.2 && ./bootstrap && make -j4 && make install
RUN cmake --version

RUN unlink /usr/bin/python && ln -s /usr/bin/python3 /usr/bin/python
RUN pip install numpy

RUN cd /tmp && wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip && unzip opencv.zip
RUN cd /tmp && wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.1.0.zip && unzip opencv_contrib.zip

RUN mkdir /tmp/opencv-3.1.0/3rdparty/ippicv/downloads && mkdir /tmp/opencv-3.1.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e
RUN cd /tmp/opencv-3.1.0/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e && wget https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a676001ca8075ada498583e4166079e5744668/ippicv/ippicv_linux_20151201.tgz

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