#!/bin/bash
set -e

TEST_SOURCE=hello_world.cpp
TEST_TARGET="${TEST_SOURCE/\.cpp/}"

CXXFLAGS="$(rpm --eval '%{build_cxxflags}')"
LDFLAGS="$(rpm --eval '%{build_ldflags}')"

# build target using distribution-specific flags
g++ -std=c++11 $CXXFLAGS $LDFLAGS -o $TEST_TARGET $TEST_SOURCE

# test that target exists
test -f ./$TEST_TARGET

# test that target is executable
test -x ./$TEST_TARGET

# test that target runs successfully
./$TEST_TARGET "Hello, world!"
