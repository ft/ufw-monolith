SH = /bin/sh

SUBMODULES_TEST = googletest gtest-tap-listener
SUBMODULES_LIBRARIES = ufw

all: prepare-submodules-test
all: prepare-tests
all: prepare-submodules-libraries
all: insinuate-clang-format

insinuate-clang-format:
	ln -sf ufw/.clang-format .clang-format

prepare-tests:
	$(SH) ./prepare build googletest

prepare-submodules-test:
	$(SH) ./prepare submodules $(SUBMODULES_TEST)

prepare-submodules-libraries:
	$(SH) ./prepare submodules $(SUBMODULES_LIBRARIES)

.PHONY: insinuate-clang-format prepare-tests prepare-submodules-test
.PHONY: prepare-submodules-libraries
.PHONY: all
