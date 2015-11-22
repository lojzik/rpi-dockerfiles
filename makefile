NS=lojzik

ROOTDIR=.

BUILD=docker build -t $@ --rm  $(ROOTDIR)/$(@F)

all:  


clean: delete-stopped delete-untagged
  
delete-untagged:
	docker rmi $$(docker images -q -f dangling=true)
delete-stopped:
	docker rm $$(docker ps -a -q)

build-all: $(NS)/rpi-nginx $(NS)/rpi-php-cli $(NS)/rpi-php-fpm $(NS)/rpi-i2c $(NS)/rpi-python $(NS)/rpi-adafruit $(NS)/mariadb 
	
$(NS)/rpi-nginx: 
	$(BUILD)

$(NS)/rpi-php-cli: 
	$(BUILD)
		
$(NS)/rpi-php-fpm: $(NS)/php-cli
	$(BUILD)

$(NS)/rpi-i2c: 
	$(BUILD)

$(NS)/rpi-python: 
	$(BUILD)
	
$(NS)/rpi-adafruit: $(NS)/rpi-python
	$(BUILD)


$(NS)/mariadb: $(NS)/debian\:jessie
	$(BUILD)

		