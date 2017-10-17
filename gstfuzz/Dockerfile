FROM ossfuzz/base-libfuzzer
MAINTAINER bilboed@bilboed.com
RUN apt-get build-dep -y \
    gstreamer1.0-alsa \
    gstreamer1.0-libav \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-bad-faad \
    gstreamer1.0-plugins-bad-videoparsers \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly-amr \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-pulseaudio \
    gstreamer1.0-tools \
    gstreamer1.0 \
    gst-plugins-base1.0 \
    gst-rtsp-server1.0

RUN git clone --recursive --depth 1 https://anongit.freedesktop.org/git/gstreamer/orc && \
    git clone --recursive --depth 1 https://anongit.freedesktop.org/git/gstreamer/gstreamer && \
    git clone --recursive --depth 1 https://anongit.freedesktop.org/git/gstreamer/gst-plugins-base && \
    git clone --recursive --depth 1 https://anongit.freedesktop.org/git/gstreamer/gst-plugins-good && \
    git clone --recursive --depth 1 https://anongit.freedesktop.org/git/gstreamer/gst-plugins-bad && \
    git clone --recursive --depth 1 https://anongit.freedesktop.org/git/gstreamer/gst-plugins-ugly && \
    git clone --recursive --depth 1 https://anongit.freedesktop.org/git/gstreamer/gst-libav

COPY build.sh $SRC/ #GO
