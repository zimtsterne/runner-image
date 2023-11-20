FROM ghcr.io/actions/actions-runner:latest
RUN sudo apt-get update
RUN sudo apt-get install git wget build-essential pkg-config libglib2.0-dev libcairo-gobject2 libcairo2-dev libgtk-3-dev -y


#install wine
RUN sudo mkdir -pm755 /etc/apt/keyrings
RUN sudo wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key
RUN sudo wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/ubuntu/dists/focal/winehq-focal.sources
RUN sudo dpkg --add-architecture i386
RUN sudo apt-get update
RUN sudo apt-get install --install-recommends winehq-stable p7zip-full unzip -y

#install windows go
RUN wget https://go.dev/dl/go1.21.1.windows-amd64.zip -O go.zip && \
	unzip go.zip && \
	sudo mv go /go-windows && \
	rm go.zip

#install windows gcc
RUN wget https://github.com/niXman/mingw-builds-binaries/releases/download/13.1.0-rt_v11-rev1/x86_64-13.1.0-release-posix-seh-msvcrt-rt_v11-rev1.7z -O gcc.7z && \
	sudo 7za x -y gcc.7z -o/gcc-windows/ && \
	rm gcc.7z

