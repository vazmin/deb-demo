CC:=gcc
exe:=deb-demo
obj:=hello.o

TARGET_PREFIX=$(DESTDIR)/usr
TARGET_PATH = $(TARGET_PREFIX)/bin

all:$(obj)
	$(CC) -o $(exe) $(obj)  

%.o:%.c
	$(CC) -c $^ -o $@

install:
	mkdir -p $(TARGET_PATH)
	cp $(exe) $(TARGET_PATH)

.PHONY:clean
clean:
	rm -rf $(obj) $(exe)

.PHONY:deb
deb:
	dpkg-buildpackage -b --no-sign