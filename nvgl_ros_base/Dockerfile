FROM nvidia/opengl:1.0-glvnd-devel-ubuntu20.04

# This avoids keyboard interaction when asked for geographic area
ARG DEBIAN_FRONTEND=noninteractive

# Change apt source to ustc
RUN mv /etc/apt/sources.list /etc/apt/sources_backup.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal main restricted " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-updates main restricted " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal universe " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-updates universe " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal multiverse " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-updates multiverse " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-backports main restricted universe multiverse " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-security main restricted " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-security universe " >> /etc/apt/sources.list && \
echo "deb http://mirrors.ustc.edu.cn/ubuntu/ focal-security multiverse " >> /etc/apt/sources.list && \
echo "deb http://archive.canonical.com/ubuntu focal partner " >> /etc/apt/sources.list

# Install some basic utilities
RUN apt-get update \
 && apt-get install -y \
        build-essential \
        cmake \
        cppcheck \
        curl \
        doxygen \
        gdb \
        git \
        gnupg2 \
        libbluetooth-dev \
        libcwiid-dev \
        libgoogle-glog-dev \
        libspnav-dev \
        libusb-dev \
        locales \
        lsb-release \
        mercurial \
        python3-dbg \
        python3-empy \
        python3-numpy \
        python3-pip \
        python3-psutil \
        python3-venv \
        software-properties-common \
        sudo \
        tzdata \
        vim \
        wget \
        curl \
 && apt-get clean

# Set Locale for ROS 2
RUN locale-gen en_US en_US.UTF-8 && \
  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
  export LANG=en_US.UTF-8

# Add ROS2 key
COPY ../ros.key  /usr/share/keyrings/ros-archive-keyring.gpg
RUN curl -s https://gitee.com/ohhuo/rosdistro/raw/master/ros.asc | apt-key add -

# Set up sources.list
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
    https://mirrors.tuna.tsinghua.edu.cn/ros2/ubuntu focal main" \
  | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null


RUN export DEBIAN_FRONTEND=noninteractive

# Install ROS 2, Gazebo, and build tools
# https://colcon.readthedocs.io/en/released/user/installation.html
RUN apt-get update \
 && apt-get install -y \
    python3-rosdep \
    python3-vcstool \
    python3-argcomplete \
    python3-colcon-common-extensions \
    python3-colcon-mixin \
    ros-foxy-desktop \
 && apt-get clean

# Initialize rosdep
RUN pip install rosdepc && rosdepc init && rosdepc update

# Add a user with the same user_id as the user outside the container
# Requires a docker build argument `user_id`
ARG user_id
ENV USERNAME developer
RUN useradd -U --uid $user_id -ms /bin/bash $USERNAME \
 && echo "$USERNAME:$USERNAME" | chpasswd \
 && adduser $USERNAME sudo \
 && echo "$USERNAME ALL=NOPASSWD: ALL" >> /etc/sudoers.d/$USERNAME
# Commands below run as the developer user
USER $USERNAME
# When running a container start in the developer's home folder
WORKDIR /home/$USERNAME
