# Use the official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Set environment variables to specify the C++ compiler
ENV CXX=g++
ENV GEOGRAPHIC_AREA=Africa

# Update package lists and install necessary packages
ARG GEOGRAPHIC_AREA=Africa
ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y tzdata build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 \
                       libssl-dev libevent-dev libboost-system-dev \
                       libboost-filesystem-dev libboost-chrono-dev \
                       libboost-test-dev libboost-thread-dev wget git autoconf

# Clone your repository
RUN git clone https://github.com/browniecoin/browniecoins.git

# Set the working directory
WORKDIR /browniecoins

# Run autogen.sh and configure
RUN ./autogen.sh && \
    ./configure --disable-wallet && \
    make

# Expose the Bitcoin P2P port
EXPOSE 8333

# Start Bitcoin Core

CMD ["chmod", "+x", "/browniecoins/rungento.sh"]

CMD ["/browniecoins/src/brownied", "-printtoconsole"]

# Install OpenSSH server
RUN apt-get update && apt-get install -y openssh-server

# Create an SSH user
RUN useradd -ms /bin/bash sshuser

# Set a password for the SSH user (replace 'password' with your desired password)
RUN echo 'sshuser:password' | chpasswd

# Allow SSH access
RUN mkdir /var/run/sshd

# Expose SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
