#!/usr/bin/env bash

colcon build --base-paths "$@" --build-base "$@/build" --install-base "$@/install" --symlink-install --executor sequential
