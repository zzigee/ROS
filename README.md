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

./install_catkinws.sh turtle_ws

cd turtle_ws/

wget https://raw.githubusercontent.com/katebrighteyes/jetson_ros_melodic/master/next/setup_SimulJetson.sh

chmod 777 setup_SimulJetson.sh

./setup_SimulJetson.sh

cd ~/turtle_ws/src/

git clone https://github.com/ROBOTIS-GIT/turtlebot3.git

git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git

git clone https://github.com/ROBOTIS-GIT/turtlebot3_simulations.git

cd ~/turtle_ws

catkin_make

source ./devel/setup.bash

====================================
 ***** gazebo and telelop ***** 
====================================
1. world gazebo
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch
---------------------------------------------------------
*Note: If this node failed
libcurl: (51) SSL: no alternative certificate subject name matches target host name 'api.ignitionfuel.org' 
-> You need  vim ~/.ignition/fuel/config.yaml and modify as following.

url: https://api.ignitionfuel.org
to
url: https://api.ignitionrobotics.org
---------------------------------------------------------
2. turtlebot3_teleop

$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

====================================
 ***** look around various gazebo ***** 
====================================
1. empty gazebo
$ roslaunch turtlebot3_gazebo turtlebot3_empty_world.launch

2. world gazebo
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch

3. house
$ roslaunch turtlebot3_gazebo turtlebot3_house.launch

========================================
*** YOU CAN USE RVIZ
========================================

$ roslaunch turtlebot3_gazebo turtlebot3_gazebo_rviz.launch

====================================
 ***** move in gazebo ***** 
====================================
1) by teleop
====================================
1. world gazebo
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch

2. teleop
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

3. check rqt_graph
$ rqt_graph 

====================================
2) by drive simulationm
====================================
1. world gazebo
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch

2. simulation
roslaunch turtlebot3_gazebo turtlebot3_simulation.launch

3. check rqt_graph
$ rqt_graph 

====================================
 ***** turtlebot3 SLAM ***** 
====================================
1. world gazebo
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch

--------------------
2. turtlebot3_slam

$ roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping

https://newscrewdriver.com/2018/08/11/running-turtlebot3-mapping-demonstration-with-a-twist/
*Note: If this node failed to launch with the error ERROR: cannot launch node of type [gmapping/slam_gmapping]: gmapping it means the required module has not been installed. Install (on Ubuntu) with sudo apt install ros-melodic-slam-gmapping.

-------------
2-1
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=gmapping
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=cartographer
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=hector
roslaunch turtlebot3_slam turtlebot3_slam.launch slam_methods:=karto

slam_methods:=xxxxx
gmapping, cartographer, hector, karto

sudo apt-get install ros-melodic-cartographer ros-melodic-cartographer-ros ros-melodic-cartographer-ros-msgs ros-melodic-cartographer-rviz

sudo apt-get install ros-melodic-hector-mapping

sudo apt-get install ros-melodic-slam-karto
-------------

3. turtlebot3_teleop

$ roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

OR YOU CAN USE

$ roslaunch turtlebot3_gazebo turtlebot3_simulation.launch

------------------
*** COMPLETE MAP BY TRAVELIONG WITH TELEOP
** THEN YOU HAVE TO SAVE A MAP FILE !!!!!!


rosrun map_server map_saver -f ~/map
 
 

3. check rqt_graph
$ rqt_graph 
============================

====================================
 ***** turtlebot3 NAVIGATIOM ***** 
====================================
1. world gazebo
$ roslaunch turtlebot3_gazebo turtlebot3_world.launch

--------------------
2. turtlebot3_navigation

$ $ roslaunch turtlebot3_navigation turtlebot3_navigation.launch map_file:=$HOME/map.yaml

*** REFER this site
http://emanual.robotis.com/docs/en/platform/turtlebot3/navigation/#navigation


3. check rqt_graph
$ rqt_graph 
============================




