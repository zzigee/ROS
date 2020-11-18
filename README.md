# Install ros_melodic

ROS melodic 설치 (Jetpack 4.x 버전 설치 이후)

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt update




SLAM based on Gazebo

export TURTLEBOT3_MODEL=waffle

Create Workspace 
./install_catkinws.sh turtle_ws
