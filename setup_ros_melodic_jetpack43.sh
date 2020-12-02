#~/bin/bash 

## Install ROS melodic 
echo "Install ROS >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sleep 3  # Waits 1 seconds.

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt -y install ros-melodic-desktop

sudo apt -y install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo rosdep init

rosdep update

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc


## Install catkin 
echo "Install Catkin >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sleep 3  # Waits 1 seconds.

cd ~ 

wget https://raw.githubusercontent.com/katebrighteyes/jetson_ros_melodic/master/install_catkinws.sh

chmod 777 install_catkinws.sh

./install_catkinws.sh



## Install VLP16 for ROS melodic 
echo "\n\nInstall VLP16 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sleep 3  # Waits 1 seconds.

sudo apt-get -y install ros-melodic-velodyne

cd ~/catkin_ws/src/ && git clone https://github.com/ros-drivers/velodyne.git

rosdep install --from-paths src --ignore-src --rosdistro YOURDISTRO -y

cd ~/catkin_ws/

catkin_make

echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

source ~/.bashrc


## Install Loam SLAM for Velodyne
echo "\n\nInstall Loam SLAM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
sleep 3  # Waits 3 seconds.

cd ~/catkin_ws/src/

git clone https://github.com/laboshinl/loam_velodyne.git

cd ~/catkin_ws

catkin_make -DCMAKE_BUILD_TYPE=Release 

source ~/.bashrc

echo "End Script"
