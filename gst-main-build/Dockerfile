FROM gst-build-base

VOLUME ["/prefix"]
WORKDIR /work
RUN mkdir /checkouts && \
    cd /checkouts && \
        for i in  orc common gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav gst-build gst-devtools\
                  gst-docs gst-editing-services gst-omx gst-python gst-rtsp-server; \
           do \
	     git clone --reference=/repositories/$i.git https://anongit.freedesktop.org/git/gstreamer/$i; \
	   done

CMD /bin/bash
