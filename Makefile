script := sms.sh
bin =
uname := $(shell uname)
ifeq ($(uname),Linux)
        bin := /usr/bin
else ifeq ($(uname),Darvin)
	#please add something
endif


check-bin:
ifndef bin
	$(error system not yet supported.)
endif

install:check-bin
		install -m=0755 $(script) $(bin)/$(script)
uninstall:check-bin
		rm $(bin)/$(script)
