#!/bin/bash

# LLVM Build
# Tharindu Patabandi <tharindu@protonmail.com>

LLVM_REVISION="adba14acea99cc6a17d837763a3248c9d4a2fadf"

git checkout $LLVM_REVISION

if [[ -d build ]]; then
	cd build
	ninja clean
else
	mkdir build && cd build
fi

cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_ASSERTIONS=ON ../llvm -DLLVM_ENABLE_PROJECTS="mlir;llvm;lld" -DLLVM_TARGETS_TO_BUILD="host;NVPTX;AMDGPU"

ninja
