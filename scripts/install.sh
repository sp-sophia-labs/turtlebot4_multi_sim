#!/usr/bin/env bash

set -ex

sudo apt update
sudo apt install -y ros-galactic-desktop wget
source /opt/ros/$ROS_DISTRO/setup.sh

sudo sh -c 'echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list'
wget http://packages.osrfoundation.org/gazebo.key -O - | sudo apt-key add -
sudo apt-get update && sudo apt-get install -y ignition-edifice

sudo apt install -y python3-pip python3-wstool python3-catkin-tools python3-rosdep python3-colcon-common-extensions

sudo rosdep init || 1
rosdep update
rosdep install --from-paths src --ignore-src --rosdistro=$ROS_DISTRO -r -y