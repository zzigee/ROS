# Install ros_melodic

## ROS melodic 설치 (Jetpack 4.x 버전 설치 이후)

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update

sudo apt install ros-melodic-desktop

sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo rosdep init

rosdep update

echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

source ~/.bashrc


## Test ROS 

roscore

rosrun turtlesim turtlesim_node

rosrun turtlesim turtle_teleop_key


## Create Workspace 

wget https://raw.githubusercontent.com/katebrighteyes/jetson_ros_melodic/master/install_catkinws.sh

chmod 777 install_catkinws.sh

./install_catkinws.sh


## Create Package 

cd ~/catkin_ws/src

catkin_create_pkg ros_topic_test std_msgs roscpp

cd catkin_ws

catkin_make

cd catkin_ws

source ./devel/setup.bash

rosrun ros_topic_test ros_pub_test



# SLAM based on Gazebo

export TURTLEBOT3_MODEL=waffle

Create Workspace 
./install_catkinws.sh turtle_ws
