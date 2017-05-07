all:
	@echo "[Step 1/5] Building for macOS..."
	@make all-macos
	@echo "[Step 2/5] Building for Ubuntu x86..."
	@make all-ubuntu32
	@echo "[Step 3/5] Building for Ubuntu x86_64..."
	@make all-ubuntu64
	@echo "[Step 4/5] Building for Windows x86..."
	@make all-windows32
	@echo "[Step 5/5] Building for Windows x86_64..."
	@make all-windows64

# macOS:
#

all-macos:
	@vagrant up macos --no-provision
	@make bootstrap-macos \
	&& make build-macos \
	&& make check-macos \
	&& make dist-macos
	@vagrant destroy -f macos

bootstrap-macos:
	@vagrant provision macos --provision-with bootstrap

build-macos:
	@vagrant provision macos --provision-with build

check-macos:
	@vagrant provision macos --provision-with check

dist-macos:
	@vagrant provision macos --provision-with dist

# Ubuntu x86:
#

all-ubuntu32:
	@vagrant up ubuntu32 --no-provision
	@make bootstrap-ubuntu32 \
	&& make build-ubuntu32 \
	&& make check-ubuntu32 \
	&& make dist-ubuntu32
	@vagrant destroy -f ubuntu32

bootstrap-ubuntu32:
	@vagrant provision ubuntu32 --provision-with bootstrap

build-ubuntu32:
	@vagrant provision ubuntu32 --provision-with build

check-ubuntu32:
	@vagrant provision ubuntu32 --provision-with check

dist-ubuntu32:
	@vagrant provision ubuntu32 --provision-with dist

# Ubuntu x86_64:
#

all-ubuntu64:
	@vagrant up ubuntu64 --no-provision
	@make bootstrap-ubuntu64 \
	&& make build-ubuntu64 \
	&& make check-ubuntu64 \
	&& make dist-ubuntu64
	@vagrant destroy -f ubuntu64

bootstrap-ubuntu64:
	@vagrant provision ubuntu64 --provision-with bootstrap

build-ubuntu64:
	@vagrant provision ubuntu64 --provision-with build

check-ubuntu64:
	@vagrant provision ubuntu64 --provision-with check

dist-ubuntu64:
	@vagrant provision ubuntu64 --provision-with dist

# Windows x86:
#

all-windows32:
	@vagrant up windows32 --no-provision
	@make bootstrap-windows32 \
	&& make build-windows32 \
	&& make check-windows32 \
	&& make dist-windows32
	@vagrant destroy -f windows32

bootstrap-windows32:
	@vagrant provision windows32 --provision-with bootstrap

build-windows32:
	@vagrant provision windows32 --provision-with build

check-windows32:
	@vagrant provision windows32 --provision-with check

dist-windows32:
	@vagrant provision windows32 --provision-with dist

# Windows x86_64:
#

all-windows64:
	@vagrant up windows64 --no-provision
	@make bootstrap-windows64 \
	&& make build-windows64 \
	&& make check-windows64 \
	&& make dist-windows64
	@vagrant destroy -f windows64

bootstrap-windows64:
	@vagrant provision windows64 --provision-with bootstrap

build-windows64:
	@vagrant provision windows64 --provision-with build

check-windows64:
	@vagrant provision windows64 --provision-with check

dist-windows64:
	@vagrant provision windows64 --provision-with dist

.PHONY: \
	all \
	all-macos bootstrap-macos build-macos check-macos dist-macos \
	all-ubuntu32 bootstrap-ubuntu32 build-ubuntu32 check-ubuntu32 dist-ubuntu32 \
	all-ubuntu64 bootstrap-ubuntu64 build-ubuntu64 check-ubuntu64 dist-ubuntu64 \
	all-windows32 bootstrap-windows32 build-windows32 check-windows32 dist-windows32 \
	all-windows64 bootstrap-windows64 build-windows64 check-windows64 dist-windows64
