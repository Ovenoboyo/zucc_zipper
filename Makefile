#!/bin/bash

NAME ?= Zucc

VERSION ?= oof

DATE := $(shell date +"%m%d-%H%M")

#ZIP := $(NAME)-$(VERSION)-$(DATE).zip
ZIP := $(NAME)-$(VERSION).zip
export ZIPTEST = $(NAME)-$(VERSION)

EXCLUDE := Makefile *.git* *.jar* *.zip* *.fuse* *.txt* *.md* placeholder *.py* 

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@rm -f *.zip*
	@rm -f /media/oveno/649AC4299AC3F6181/userbot/Telegram-UserBot/Zucc*
	@zip -r9 "$@" . -x $(EXCLUDE)
	@mkdir ../prev/$(DATE)
	@cp Changelog.txt ../prev/$(DATE)/Changelog.txt
	@cp "$(NAME)-"*.zip* ../prev/$(DATE)/
	@cp "$(NAME)-"*.zip* /media/oveno/649AC4299AC3F6181/userbot/Telegram-UserBot/
	@echo "$(ZIP)" > /media/oveno/649AC4299AC3F6181/userbot/Telegram-UserBot/zucc.txt

test:
	@echo "Creating ZIP-test"
	@rm -f *.zip*
	@rm -f /media/oveno/649AC4299AC3F6181/userbot/Telegram-UserBot/Zucc*
	@zip -r9 "$(ZIP)" . -x $(EXCLUDE)
	@mkdir ../prev/$(DATE)-test
	@python increment.py
	@cp Changelog.txt ../prev/$(DATE)-test/Changelog.txt
	@cp "$(NAME)-"*.zip* ../prev/$(DATE)-test/
	@cp "$(NAME)-"*.zip* /media/oveno/649AC4299AC3F6181/userbot/Telegram-UserBot/
	@mv zucc.txt /media/oveno/649AC4299AC3F6181/userbot/Telegram-UserBot/zucc.txt

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf kernel/Image*
	@rm -vf treble/*
	@rm -vf non-treble/*
	@echo "Done."

sign:
	java -classpath testsign.jar testsign "$(NAME)-$(VERSION)-$(DATE)".zip "$(NAME)-$(VERSION)-$(DATE)"-signed.zip
