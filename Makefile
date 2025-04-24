# Makefile to generate a reveal.js presentation using Pandoc

SRC_DIR := ./src
OUT_DIR := ./out

MD_FILES := $(wildcard $(SRC_DIR)/*.md)
HTML_OUTPUTS := $(patsubst $(SRC_DIR)/%.md,$(OUT_DIR)/%.html,$(MD_FILES))

PANDOC_OPTIONS := --to=revealjs --standalone --slide-level=2 -V revealjs-url=https://cdn.jsdelivr.net/npm/reveal.js

all: $(HTML_OUTPUTS)

$(OUT_DIR)/%.html: $(SRC_DIR)/%.md
	mkdir -p $(OUT_DIR)
	pandoc $(PANDOC_OPTIONS) -o $@ $<

clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean
