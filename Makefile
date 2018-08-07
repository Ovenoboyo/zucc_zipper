NAME ?= Zucc

VERSION ?= Agama

DATE := $(shell date +"%m%d-%H%M")

ZIP := $(NAME)-$(VERSION)-$(DATE).zip

EXCLUDE := Makefile *.git* *.jar* *.zip* *.fuse* *.txt* *.md*

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@mkdir ../prev/$(DATE)
	@mv Changelog.txt ../prev/$(DATE)/Changelog.txt
	@cp "$(NAME)-"*.zip* ../prev/$(DATE)/

clean:
	@rm -vf "$(NAME)-"*.zip*
	@rm -vf Image*
	@echo "Done."

sign:
	java -classpath testsign.jar testsign "$(NAME)-$(VERSION)-$(DATE)".zip "$(NAME)-$(VERSION)-$(DATE)"-signed.zip
