SYNC_TO ?= root@r7v.me:/var/www/html/r7v.me

.PHONY: build
build:
	hugo

.PHONY: publish
publish: build
	rsync -a --delete public/ $(SYNC_TO)
