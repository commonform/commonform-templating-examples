TEMPLATES=$(wildcard *.mustache) $(wildcard *.ejs)
SOURCES=$(addsuffix .commonform, $(basename $(TEMPLATES)))
MUSTACHE=node_modules/.bin/mustache
COMMONFORM=node_modules/.bin/commonform
EJS=node_modules/.bin/ejs-cli

TARGETS=$(SOURCES:commonform=docx) $(SOURCES:commonform=txt) $(SOURCES)

all: $(TARGETS)

$(MUSTACHE):
	npm install mustache

$(COMMONFORM):
	npm install commonform-cli

$(EJS):
	npm install ejs-cli

%.docx: %.commonform %.title.txt $(COMMONFORM)
	$(COMMONFORM) render --format docx --title "$(shell cat $*.title.txt)" < $*.commonform > $@

%.txt: %.commonform $(COMMONFORM)
	$(COMMONFORM) render --format terminal < $*.commonform > $@

%.commonform: %.mustache %.json $(MUSTACHE)
	$(MUSTACHE) $*.json $*.mustache > $@

%.commonform: %.ejs %.json $(EJS)
	$(EJS) --options $*.json $*.ejs > $@

.PHONY: clean check

check: $(SOURCES:mustache=commonform)
	bash -c "for file in ${SOURCES:mustache=commonform}; do commonform lint < \$$file ; done"

clean:
	rm -rf $(TARGETS)
