# Makefile to generate a reveal.js presentation using Pandoc

# Directory variables
SRC_DIR := ./src
IMG_DIR := ./images
IMG_SRC_DIR := $(SRC_DIR)/images
STYLES_DIR := ./styles

# Source and target files
MD_FILES := $(wildcard $(SRC_DIR)/*.md)
PLANTUML_FILES := $(wildcard $(IMG_SRC_DIR)/*.plantuml)
GENERATED_IMG_FILES := $(patsubst $(IMG_SRC_DIR)/%.plantuml,$(IMG_DIR)/%.png,$(PLANTUML_FILES))
CUSTOM_CSS := $(wildcard $(STYLES_DIR)/*.css)
OUTPUT := presentation.html
INTERMEDIATE_PDF := intermediate_presentation.pdf
PDF_OUTPUT := presentation.pdf

# Pandoc options for reveal.js and PDF output
PANDOC_OPTS := -t revealjs -s --slide-level=2 -V revealjs-url=https://revealjs.com
PANDOC_PDF_OPTS := -t beamer

# CSS options for styling the presentation
CSS_OPTS := $(foreach cssfile,$(CUSTOM_CSS),-V $(cssfile))

# Default rule
all: $(OUTPUT)

# Rule to create the presentation
$(OUTPUT): $(MD_FILES) $(GENERATED_IMG_FILES) $(CUSTOM_CSS)
	pandoc $(PANDOC_OPTS) $(CSS_OPTS) -o $@ $(MD_FILES)

# Rule to create a PDF handout
pdf: $(MD_FILES)
	pandoc $(PANDOC_PDF_OPTS) -o $(PDF_OUTPUT) $(MD_FILES)

# Rule to generate images from PlantUML files
images: $(GENERATED_IMG_FILES)

$(IMG_DIR)/%.png: $(IMG_SRC_DIR)/%.plantuml
	plantuml -tpng -o ../$(IMG_DIR) $<

# Rule to start the presentation using Python's HTTP server
serve: $(OUTPUT)
	python3 -m http.server

# Clean rule
clean:
	rm -f $(OUTPUT) $(PDF_OUTPUT) $(INTERMEDIATE_PDF)
	rm -f $(GENERATED_IMG_FILES)

.PHONY: all pdf serve clean
