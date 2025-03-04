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

# # Copy the setup script to enforce the desktop layout
# COPY setup_layout.sh /etc/profile.d/setup_layout.sh
# RUN chmod +x /etc/profile.d/setup_layout.sh

# # Ensure the script runs when the GUI desktop starts
# RUN echo "bash /etc/profile.d/setup_layout.sh &" >> /root/.xsessionrc

# Default to bash so participants can interact with the challenge
CMD ["bash"]
