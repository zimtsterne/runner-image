FROM ghcr.io/actions/actions-runner:latest
RUN sudo apt-get update
RUN sudo apt-get install git wget build-essential pkg-config libglib2.0-dev libcairo-gobject2 libcairo2-dev libgtk-3-dev -y
