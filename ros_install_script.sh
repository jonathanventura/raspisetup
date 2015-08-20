#!/bin/sh
sudo sh -c "echo 'deb http://packages.ros.org/ros/ubuntu trusty main' > /etc/apt/sources.list.d/ros-latest.list";
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -;
sudo apt-get update;
sudo apt-get -y download libegl1-mesa-dev
sudo dpkg -i --force-overwrite libegl1-mesa-dev_10.1.3-0ubuntu0.4_armhf.deb
sudo apt-get -y download libgles2-mesa-dev
sudo dpkg -i --force-overwrite libgles2-mesa-dev_10.1.3-0ubuntu0.4_armhf.deb
sudo apt-get -y install -f
sudo apt-get -y install g++ ros-indigo-ros-base ros-indigo-ros-control ros-indigo-ros-controllers ros-indigo-navigation ros-indigo-teleop-twist-keyboard ros-indigo-vision-opencv ros-indigo-ar-track-alvar ros-indigo-camera-calibration ros-indigo-rosbag ros-indigo-serial ros-indigo-compressed-image-transport ros-indigo-camera-info-manager;
sudo apt-get -y install python-rosdep;
sudo rosdep init;
rosdep update;
echo "source /opt/ros/indigo/setup.bash" >> ~/.bashrc;
source ~/.bashrc;
sudo apt-get -y install python-rosinstall;
mkdir ~/ros_catkin_ws;
cd ~/ros_catkin_ws;
mkdir src;
cd src;
catkin_init_workspace;
cd ..;
catkin_make;
echo "source /home/ubuntu/ros_catkin_ws/devel/setup.bash" >> ~/.bashrc;
source ~/.bashrc;
cd src;
git clone https://github.com/jonathanventura/raspicam_node.git;
cd ..;
catkin_make;
source ~/.bashrc;
