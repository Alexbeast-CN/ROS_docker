ARG FROM_IMAGE=nvgl_ros_base:foxy
ARG OVERLAY_WS=/home/developer/workspace

FROM $FROM_IMAGE

ARG OVERLAY_WS
WORKDIR $OVERLAY_WS
RUN sudo apt-get update && sudo apt install -y \
    ros-foxy-ros2-control\
    ros-foxy-ros2-controllers\
    ros-foxy-xacro\
    ros-foxy-velodyne*\
    ros-foxy-realsense2*\
    ros-foxy-robot-localization\
    ros-foxy-joint-state-broadcaster\
    ros-foxy-joint-state-controller\
    ros-foxy-joint-state-publisher\
    ros-foxy-joint-state-publisher-gui\
    ros-foxy-controller-manager\
    ros-foxy-controller-manager-msgs\
    ros-foxy-control-msgs\
    ros-foxy-controller-interface\
    ros-foxy-twist-mux\
    ros-foxy-gazebo*\
    ros-foxy-slam-toolbox\
    ros-foxy-navigation2\
    ros-foxy-nav2-bringup\
    ros-foxy-cartographer\
    ros-foxy-cartographer-ros


# Set up environment variables
ENV DISPLAY=:0
ENV QT_X11_NO_MITSHM=1
ENV XAUTHORITY=/tmp/.docker.xauth

# setup ROS
RUN echo "source /opt/ros/foxy/setup.bash" >> /home/$USERNAME/.bashrc

