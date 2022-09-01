.PHONY: all install build safe_build clean
.DEFAULT_GOAL := all

all:
	$(MAKE) install
	$(MAKE) clean
	$(MAKE) build

install:
	scripts/install.sh

build:
	scripts/build.sh

safe_build:
	scripts/safe_build.sh

clean:
	rm -rf ./build
	rm -rf ./install
