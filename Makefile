# Makefile to generate a reveal.js presentation using Pandoc

# Directory variables
SRC_DIR := ./src
OUT_DIR := ./out

# Source and target files
MD_FILES := $(wildcard $(SRC_DIR)/*.md)
HTML_OUTPUT := $(OUT_DIR)/presentation.html

# Pandoc options for reveal.js and PDF output
PANDOC_OPTIONS := --to=revealjs --standalone --slide-level=2 -V revealjs-url=https://cdn.jsdelivr.net/npm/reveal.js

# Default rule
all: $(HTML_OUTPUT)

# Rule to create the presentation
$(HTML_OUTPUT): $(MD_FILES)
	mkdir -p $(OUT_DIR)
	pandoc $(PANDOC_OPTIONS) -o $@ $(MD_FILES)

# Clean rule
clean:
	rm -f $(OUT_DIR)

.PHONY: all


# # Directory variables
# SRC_DIR := ./src
# IMG_DIR := ./images
# IMG_SRC_DIR := $(SRC_DIR)/images
# STYLES_DIR := ./styles

# # Source and target files
# MD_FILES := $(wildcard $(SRC_DIR)/*.md)
# PLANTUML_FILES := $(wildcard $(IMG_SRC_DIR)/*.{plantuml,puml})
# GENERATED_IMG_FILES := $(patsubst $(IMG_SRC_DIR)/%.plantuml,$(IMG_DIR)/%.png,$(PLANTUML_FILES))
# CUSTOM_CSS := $(wildcard $(STYLES_DIR)/*.css)
# OUTPUT := presentation.html
# PDF_OUTPUT := presentation.pdf

# # Pandoc options for reveal.js and PDF output
# PANDOC_OPTIONS := -t revealjs -s --slide-level=2 -V revealjs-url=https://revealjs.com
# PANDOC_PDF_OPTS := -t beamer

# # CSS options for styling the presentation
# CSS_OPTS := $(foreach cssfile,$(CUSTOM_CSS),-V $(cssfile))

# # Default rule
# all: $(OUTPUT)

# # Rule to create the presentation
# $(OUTPUT): $(MD_FILES) $(GENERATED_IMG_FILES) $(CUSTOM_CSS)
# 	pandoc $(PANDOC_OPTIONS) $(CSS_OPTS) -o $@ $(MD_FILES)

# # Rule to create a PDF handout
# pdf: $(MD_FILES)
# 	pandoc $(PANDOC_PDF_OPTS) -o $(PDF_OUTPUT) $(MD_FILES)

# # Rule to generate images from PlantUML files
# images: $(GENERATED_IMG_FILES)

# $(IMG_DIR)/%.png: $(IMG_SRC_DIR)/%.plantuml
# 	plantuml -tpng -o ../$(IMG_DIR) $<

# # Rule to start the presentation using Python's HTTP server
# serve: $(OUTPUT)
# 	python3 -m http.server

# # Clean rule
# clean:
# 	rm -f $(OUTPUT) $(PDF_OUTPUT)
# 	rm -f $(GENERATED_IMG_FILES)

# .PHONY: all pdf serve clean
