SH = /bin/sh

SUBMODULES_TEST = libtap googletest gtest-tap-listener
SUBMODULES_LIBRARIES = ufw
BUILD_MODULES = libtap googletest

all: prepare-submodules-test
all: prepare-tests
all: prepare-submodules-libraries
all: insinuate-clang-format
all: configure-ufw

insinuate-clang-format:
	test -e .clang-format || ln -sf ufw/.clang-format .clang-format

prepare-tests:
	$(SH) ./prepare build $(BUILD_MODULES)

prepare-submodules-test:
	$(SH) ./prepare submodules $(SUBMODULES_TEST)

prepare-submodules-libraries:
	$(SH) ./prepare submodules $(SUBMODULES_LIBRARIES)

configure-ufw:
	$(MAKE) -C ufw config

test:
	$(MAKE) test-ufw

test-ufw: configure-ufw
	$(MAKE) -C ufw/test test

.PHONY: insinuate-clang-format prepare-tests prepare-submodules-test
.PHONY: prepare-submodules-libraries
.PHONY: configure-ufw test-ufw
.PHONY: all test
