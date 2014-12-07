#!/bin/sh

# In order to compile irony-server (the clang completion engine for
# emacs) we need to use a version of libclang that matched the clang
# compiler.

# Irony server source and destination path
IRONYSERVER_SRC=$HOME/.emacs.d/elpa/irony-20141204.1531/server
IRONYSERVER_INSTALL_PATH=$HOME/.emacs.d/irony/


# We need the libclang location...
LIBCLANG_LIBRARY=`xcode-select --print-path`/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib

# and the headers that (AAARGH!!) Xcode does not ship. The headers are
# relatively stable, so we can download them.
svn export http://llvm.org/svn/llvm-project/cfe/trunk/include/clang-c/

cmake -DCMAKE_INSTALL_RPATH_USE_LINK_PATH=ON \
      -DCMAKE_INSTALL_PREFIX=$IRONYSERVER_INSTALL_PATH \
      -DLIBCLANG_LIBRARY=$LIBCLANG_LIBRARY \
      -DLIBCLANG_INCLUDE_DIR=./ \
      $IRONYSERVER_SRC \
    && \
cmake --build . --use-stderr --config Release --target install
