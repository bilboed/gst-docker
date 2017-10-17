export INSTALL_PREFIX=$SRC/prefix
mkdir -p $INSTALL_PREFIX

cd $SRC

#CFLAGS="$CFLAGS -DBORINGSSL_UNSAFE_FUZZER_MODE"
#CXXFLAGS="$CXXFLAGS -DBORINGSSL_UNSAFE_FUZZER_MODE"
PACKAGES=orc gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad \
	gst-plugins-ugly gst-libav

for i in $PACKAGES; do
    cd $SRC/$i
    $PKG_CONFIG_PATH=$INSTALL_PREFIX/lib/pkgconfig \
		    ./autogen.sh --disable-gtk-doc --disable-docbook --disable-introspection \
		    --prefix=$INSTALL_PREFIX
    make -j4
    make install
done
# cmake -GNinja -DCMAKE_C_COMPILER=$CC -DCMAKE_CXX_COMPILER=$CXX \
#     -DCMAKE_C_FLAGS="$CFLAGS" -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
#     $SRC/boringssl/
# ninja

# fuzzerFiles=$(find $SRC/boringssl/fuzz/ -name "*.cc")

# find . -name "*.a"

# for F in $fuzzerFiles; do
#   fuzzerName=$(basename $F .cc)
#   echo "Building fuzzer $fuzzerName"
#   $CXX $CXXFLAGS -std=c++11 \
#       -o $OUT/${fuzzerName} -lFuzzingEngine $F \
#       -I $SRC/boringssl/include ./ssl/libssl.a  ./crypto/libcrypto.a

#   if [ -d "$SRC/boringssl/fuzz/${fuzzerName}_corpus" ]; then
#     zip -j $OUT/${fuzzerName}_seed_corpus.zip $SRC/boringssl/fuzz/${fuzzerName}_corpus/*
#   fi
# done
