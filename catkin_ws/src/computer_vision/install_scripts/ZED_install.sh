#install cuda 8.0
wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo dpkg -i cuda-repo-ubuntu1604-8-0-local-ga2_8.0.61-1_amd64-deb
sudo apt-get update
sudo apt-get -y install cuda

# install Point Cloud Library (PCL)
sudo apt-get -y install libpcl1 
sudo apt-get -y install ros-kinetic-pcl-ros

#install CV 3.1
sudo apt-get -y install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
git clone https://github.com/Itseez/opencv.git
cd opencv
git checkout tags/3.1.0
mkdir build
cd build
cmake  -D WITH_CUDA=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE ..


#if an error about ippicv_linux is thrown:
#    rm -f ../3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/ippicv_linux_20151201.tgz && wget https://github.com/opencv/opencv_3rdparty/raw/ippicv/master_20151201/ippicv/ippicv_linux_20151201.tgz && mv ippicv_linux_20151201.tgz ../3rdparty/ippicv/downloads/linux-808b791a6eac9ed78d32a7666804320e/ippicv_linux_20151201.tgz
#    cmake  -D WITH_CUDA=OFF -D BUILD_TESTS=OFF -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF -D CMAKE_BUILD_TYPE=RELEASE ..

make -j3
sudo make install

# install ZED_SDK for Cuda 8.0 V2.2.0 for Linux x86
wget https://cdn.stereolabs.com/developers/downloads/ZED_SDK_Linux_Ubuntu16_CUDA8_v2.2.0.run
chmod u+x ./ZED_SDK_Linux_Ubuntu16_CUDA8_v2.2.0.run
sh ./ZED_SDK_Linux_Ubuntu16_CUDA8_v2.2.0.run

# install ZED_SDK for Cuda 8.0 V2.2.1 for Drive PX2
wget https://cdn.stereolabs.com/developers/downloads/ZED_SDK_Linux_JTX2_v2.2.1.run
chmod u+x ./ZED_SDK_Linux_Ubuntu16_CUDA8_v2.2.0.run
sh ./ZED_SDK_Linux_Ubuntu16_CUDA8_v2.2.0.run
