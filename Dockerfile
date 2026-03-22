FROM docker.io/osrf/ros:humble-desktop

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y \
    ros-humble-joy ros-humble-joy-linux \
    ros-humble-rqt-image-view

WORKDIR /ros_ws

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
