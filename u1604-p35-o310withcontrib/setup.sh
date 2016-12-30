export http_proxy=http://192.168.10.176:8118
export https_proxy=http://192.168.10.176:8118
export HTTP_PROXY=http://192.168.10.176:8118
export HTTPS_PROXY=http://192.168.10.176:8118

apt-get update && apt-get -y upgrade

apt-get install -y \
build-essential \
pkg-config \
cmake \
libgtk2.0-dev \
libavcodec-dev \
libavformat-dev \
libswscale-dev \
unzip \
python3-dev \
python3-numpy


third_party_dir=~/Code/3rd_party
mkdir -p $third_party_dir

opencv_version=master
# cd $third_party_dir && wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip && unzip opencv.zip
# cd $third_party_dir && wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/3.1.0.zip && unzip opencv_contrib.zip

# cd $third_party_dir && wget -O opencv.zip https://github.com/opencv/opencv/archive/$opencv_version.zip && unzip opencv.zip
cd $third_party_dir && wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/$opencv_version.zip && unzip opencv_contrib.zip

mkdir -p $third_party_dir/ippicv/downloads && mkdir -p $third_party_dir/opencv-$opencv_version/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e
cd $third_party_dir/opencv-$opencv_version/3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e && wget https://raw.githubusercontent.com/Itseez/opencv_3rdparty/81a676001ca8075ada498583e4166079e5744668/ippicv/ippicv_linux_20151201.tgz

cd $third_party_dir/opencv-$opencv_version \
&& mkdir -p build \
&& cd build \
&& cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr/local \
-D INSTALL_C_EXAMPLES=OFF \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D OPENCV_EXTRA_MODULES_PATH=$third_party_dir/opencv_contrib-$opencv_version/modules \
-D ENABLE_PRECOMPILED_HEADERS=OFF \
-D BUILD_EXAMPLES=OFF .. \
&& make -j4 \
&& make install \
&& ldconfig
