# Use the official Ubuntu as the base image
FROM ubuntu:24.04

# Set the environment variable to avoid prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    python3 \
    python3-pip \
    git \
    tmux \
    x11-utils \
    xinput \
    firefox \
    net-tools \
    wmctrl \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy all project files
COPY . /app

# Copy and run keypress logger
# COPY keypress_logger.sh /app/keypress_logger.sh
# RUN chmod +x /app/keypress_logger.sh

# Ensure logger starts when a participant launches the terminal
# RUN echo "/app/keypress_logger.sh &" >> /root/.bashrc

# Copy the setup script to enforce the desktop layout
COPY setup_layout.sh /etc/profile.d/setup_layout.sh
RUN chmod +x /etc/profile.d/setup_layout.sh


# Default to bash so participants can interact with the challenge
CMD ["bash"]


# keystroke: xevents, hook windows, no network in docker; use jscode 
# activity in the terminal; with in the container, hook the keystroke (docker tool)
# in container will be better, faster
# pop up window fixed at a location (initial task)
# use an api instead of command 
# monitor: ensure the window is fixed 