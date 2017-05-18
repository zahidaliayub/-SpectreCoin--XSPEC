target_os ?= "unknown"
target_arch ?= "unknown"
target_pkg ?= "unknow"
target = "$(target_os)-$(target_arch)"

all:
	@vagrant up --no-provision $(target)
	@vagrant provision $(target) --provision-with upload_files
	@make bootstrap \
	&& make build \
	&& make check \
	&& make deploy
	@vagrant destroy --force $(target)

bootstrap:
	@vagrant provision $(target) --provision-with bootstrap

build:
	@vagrant provision $(target) --provision-with build

check:
	@vagrant provision $(target) --provision-with check

deploy:
	@vagrant provision $(target) --provision-with deploy

.PHONY: all bootstrap build check deploy
