SOURCES=$(wildcard *.mustache)
TITLE=$(shell cat title.txt)
MUSTACHE=node_modules/.bin/mustache
COMMONFORM=node_modules/.bin/commonform

TARGETS=$(SOURCES:mustache=docx) $(SOURCES:mustache=txt) $(SOURCES:mustache=commonform)

all: $(TARGETS)

$(MUSTACHE):
	npm install mustache

$(COMMONFORM):
	npm install commonform-cli

%.docx: %.commonform title.txt $(COMMONFORM)
	./node_modules/.bin/commonform render --format docx --title "${TITLE}" < $< > $@

%.txt: %.commonform $(COMMONFORM)
	./node_modules/.bin/commonform render --format terminal < $< > $@

%.commonform: %.mustache %.json $(MUSTACHE)
	./node_modules/.bin/mustache "$*.json" "$*.mustache" > $@

.PHONY: clean check

check: $(SOURCES:mustache=commonform)
	bash -c "for file in ${SOURCES:mustache=commonform}; do commonform lint < \$$file ; done"

clean:
	rm -rf $(TARGETS)
