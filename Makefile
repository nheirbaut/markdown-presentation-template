# Makefile to generate a reveal.js presentation using Pandoc

SRC_DIR := ./src
OUT_DIR := ./out
IMG_SRC_DIR := $(SRC_DIR)/images
IMG_OUT_DIR := $(OUT_DIR)/images

MD_FILES := $(wildcard $(SRC_DIR)/*.md)
HTML_OUTPUTS := $(patsubst $(SRC_DIR)/%.md,$(OUT_DIR)/%.html,$(MD_FILES))

IMG_EXT := png jpg jpeg gif svg webp bmp tiff tif ico avif jxl heic heif
IMG_FILES := $(foreach ext,$(IMG_EXT),$(wildcard $(IMG_SRC_DIR)/*.$(ext)))
IMG_OUTPUTS := $(patsubst $(IMG_SRC_DIR)/%,$(IMG_OUT_DIR)/%,$(IMG_FILES))

PANDOC_OPTIONS := --to=revealjs --standalone --slide-level=2 -V revealjs-url=https://cdn.jsdelivr.net/npm/reveal.js

all: $(HTML_OUTPUTS) $(IMG_OUTPUTS)

$(OUT_DIR)/%.html: $(SRC_DIR)/%.md
	mkdir -p $(OUT_DIR)
	pandoc $(PANDOC_OPTIONS) -o $@ $<

$(IMG_OUT_DIR)/%: $(IMG_SRC_DIR)/%
	mkdir -p $(IMG_OUT_DIR)
	cp $< $@

clean:
	rm -rf $(OUT_DIR)

.PHONY: all clean