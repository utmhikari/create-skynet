.PHONY: all linux macosx

all: linux

linux: PLAT=linux

macosx: PLAT=macosx

linux macosx:
	mkdir -p ./bin
	cd skynet && $(MAKE) $(PLAT) && cp ./skynet ../bin/skynet

clean:
	rm -rf ./bin
	cd skynet && $(MAKE) clean

