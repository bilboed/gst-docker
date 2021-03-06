FROM gst-runtime-base:latest

# Add rpmfusion repositories and install all build dependencies of GStreamer
RUN dnf builddep -y \
       gstreamer1 \
       gstreamer1-plugins-base \
       gstreamer1-plugins-good \
       gstreamer1-plugins-good-extras \
       gstreamer1-plugins-ugly \
       gstreamer1-plugins-ugly-free \
       gstreamer1-plugins-bad-nonfree \
       gstreamer1-plugins-bad-free \
       gstreamer1-plugins-bad-free-extras \
       gstreamer1-plugins-bad-freeworld \
       gstreamer1-libav \
       gstreamer1-rtsp-server  \
    && \
    rpm -e \
       gstreamer1 \
       gstreamer1-plugins-base \
       gstreamer1-devel \
       gstreamer1-plugins-base-devel \
    && \
    dnf install -y wget git \
    && \
    dnf clean all

# Clone copies of all repositories to avoid extra downloads
RUN mkdir /repositories && \
    cd /repositories && \
    for i in orc \
             common \
	     gstreamer \
	     gst-plugins-base \
	     gst-plugins-good \
	     gst-plugins-bad \
	     gst-plugins-ugly \
	     gst-libav \
	     gst-build \
	     gst-devtools\
             gst-docs \
	     gst-editing-services \
	     gst-omx \
	     gst-python \
	     gst-rtsp-server; \
      do \
        git clone --mirror https://anongit.freedesktop.org/git/gstreamer/$i; \
      done

# FIXME : Migrate above
RUN dnf install -y redhat-rpm-config patch gcc-c++

# Install repo tool
RUN wget -nd https://storage.googleapis.com/git-repo-downloads/repo -O /usr/bin/repo && chmod a+x /usr/bin/repo

# Add the user UID:1000, GID:1000, home at /gstbuild
RUN groupadd -r gstbuild -g 1000 && useradd -u 1000 -r -g gstbuild -m -d /gstbuild -s /sbin/nologin -c "Gstbuild user" gstbuild && \
    chmod 755 /gstbuild

# Set the working directory to gstbuild home directory
WORKDIR /gstbuild

# Specify the user to execute all commands below
USER gstbuild

# Configure git for various usage
RUN git config --global user.email "gstbuild@gstreamer.net" && git config --global user.name "Gstbuild Runner"
