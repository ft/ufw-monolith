SH = /bin/sh

SUBMODULES_TEST = libtap googletest gtest-tap-listener
SUBMODULES_LIBRARIES = ufw
BUILD_MODULES = libtap googletest

all:
	@printf 'Available frontend targets: prepare clean test\n'

prepare: prepare-submodules-test
prepare: prepare-tests
prepare: prepare-submodules-libraries
prepare: insinuate-clang-format
prepare: configure-ufw

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

clean:
	$(MAKE) -C ufw clean
	$(MAKE) -C libtap clean
	$(MAKE) -C googletest/build clean
	rm -f *~ "#"*"#"

.PHONY: insinuate-clang-format prepare-tests prepare-submodules-test
.PHONY: prepare-submodules-libraries
.PHONY: configure-ufw test-ufw
.PHONY: all clean prepare test
