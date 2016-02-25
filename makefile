NS=lojzik

ROOTDIR=.

BUILD=docker build -t $@ --rm  $(ROOTDIR)/$(@F)
PUSH=docker push $@ 

all:  


clean: delete-stopped delete-untagged
  
delete-untagged:
	docker rmi $$(docker images -q -f dangling=true)
delete-stopped:
	docker rm $$(docker ps -a -q)

build-all: $(NS)/rpi-nginx $(NS)/rpi-php-cli $(NS)/rpi-php-fpm $(NS)/rpi-i2c $(NS)/rpi-python $(NS)/rpi-adafruit $(NS)/rpi-mariadb $(NS)/rpi-mono $(NS)/rpi-gogs\:v0.7.33 $(NS)/rpi-aspnet\:1.0.0-rc1-final $(NS)/rpi-aspnet-demo\:1.0.0-rc1-final $(NS)/rpi-ttrss

rpi-raspbian\:wheezy/rootfs/sbin/initctl:
	./debootstrap ./rpi-raspbian\:wheezy/rootfs --variant=minbase  wheezy http://archive.raspbian.org/raspbian
	rm -rf "./rpi-raspbian:wheezy/rootfs/dev" "./rpi-raspbian:wheezy/rootfs/proc"
	mkdir -p "./rpi-raspbian:wheezy/rootfs/dev" "./rpi-raspbian:wheezy/rootfs/proc"	

rpi-raspbian\:jessie/rootfs/sbin/initctl:
	./debootstrap ./rpi-raspbian\:jessie/rootfs --variant=minbase  jessie http://archive.raspbian.org/raspbian
	rm -rf "./rpi-raspbian:jessie/rootfs/dev" "./rpi-raspbian:jessie/rootfs/proc"
	mkdir -p "./rpi-raspbian:jessie/rootfs/dev" "./rpi-raspbian:jessie/rootfs/proc"	

rpi-debian\:jessie/rootfs/sbin/initctl:
	./debootstrap ./rpi-debian\:jessie/rootfs --variant=minbase  --keyring=/root/.gnupg/pubring.gpg --arch=armhf jessie http://debian.mirror.web4u.cz
	rm -rf "./rpi-debian:jessie/rootfs/dev" "./rpi-debian:jessie/rootfs/proc"
	mkdir -p "./rpi-debian:jessie/rootfs/dev" "./rpi-debian:jessie/rootfs/proc"	
	
rpi-raspbian\:wheezy/rootfs.tar.xz: rpi-raspbian\:wheezy/rootfs/sbin/initctl
	tar --numeric-owner --force-local -caf "rpi-raspbian:wheezy/rootfs.tar.xz" -C "rpi-raspbian:wheezy/rootfs" --transform='s,^./,,' .
	
rpi-raspbian\:jessie/rootfs.tar.xz: rpi-raspbian\:jessie/rootfs/sbin/initctl
	tar --numeric-owner --force-local -caf "rpi-raspbian:jessie/rootfs.tar.xz" -C "rpi-raspbian:jessie/rootfs" --transform='s,^./,,' .

rpi-debian\:jessie/rootfs.tar.xz: rpi-debian\:jessie/rootfs/sbin/initctl
	tar --numeric-owner --force-local -caf "rpi-debian:jessie/rootfs.tar.xz" -C "rpi-debian:jessie/rootfs" --transform='s,^./,,' .

$(NS)/rpi-raspbian\:wheezy: rpi-raspbian\:wheezy/rootfs.tar.xz
	$(BUILD)
	$(PUSH)

$(NS)/rpi-raspbian\:jessie: rpi-raspbian\:jessie/rootfs.tar.xz
	$(BUILD)
	$(PUSH)

$(NS)/rpi-debian\:jessie: rpi-debian\:jessie/rootfs.tar.xz
	$(BUILD)
	$(PUSH)
	
$(NS)/rpi-nginx: $(NS)/rpi-debian\:jessie
	$(BUILD)
	$(PUSH)

$(NS)/rpi-php-cli: $(NS)/rpi-debian\:jessie
	$(BUILD)
	$(PUSH)
		
$(NS)/rpi-php-fpm: $(NS)/rpi-php-cli
	$(BUILD)
	$(PUSH)

$(NS)/rpi-i2c: $(NS)/rpi-raspbian\:jessie
	$(BUILD)
	$(PUSH)

$(NS)/rpi-python: $(NS)/rpi-debian\:jessie
	$(BUILD)
	$(PUSH)
	
$(NS)/rpi-adafruit: $(NS)/rpi-python
	$(BUILD)
	$(PUSH)


$(NS)/rpi-mariadb: $(NS)/rpi-debian\:jessie
	$(BUILD)
	$(PUSH)

$(NS)/rpi-mono: $(NS)/rpi-raspbian\:wheezy
	$(BUILD)
	$(PUSH)

$(NS)/rpi-gogs\:v0.7.19: $(NS)/rpi-debian\:jessie
	$(BUILD)
	$(PUSH)

$(NS)/rpi-gogs\:v0.7.22: $(NS)/rpi-debian\:jessie
	$(BUILD)
	$(PUSH)

$(NS)/rpi-gogs\:v0.7.33: $(NS)/rpi-debian\:jessie
	$(BUILD)
	$(PUSH)

$(NS)/rpi-ttrss: $(NS)/rpi-php-cli
	$(BUILD)
	$(PUSH)
		
$(NS)/rpi-aspnet\:1.0.0-rc1-final: $(NS)/rpi-mono
	$(BUILD)
	$(PUSH)
			
$(NS)/rpi-aspnet-demo\:1.0.0-rc1-final: $(NS)/rpi-aspnet\:1.0.0-rc1-final
	$(BUILD)
	$(PUSH)
			