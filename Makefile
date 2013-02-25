PANDOC = pandoc -s
PANDOC_HTML_OPTS = -S --mathjax=http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML --template=template.html --highlight-style=tango
PANDOC_PDF_OPTS = 
HTML_OUT = target/html
PDF_OUT = target/pdf
HTML_FILES = $(addprefix $(HTML_OUT)/, $(patsubst %.markdown, %.html, $(wildcard *.markdown)))
PDF_FILES = $(addprefix $(PDF_OUT)/, $(patsubst %.markdown, %.pdf, $(wildcard *.markdown)))
.PHONY: all clean

all: html pdf

html: $(HTML_OUT) $(HTML_FILES)

pdf: $(PDF_OUT) $(PDF_FILES)

clean:
	rm -rf $(HTML_OUT)
	rm -rf $(PDF_OUT)

$(HTML_OUT)/%.html: %.markdown
	$(PANDOC) $(PANDOC_HTML_OPTS) $< -o $@

$(PDF_OUT)/%.pdf: %.markdown
	$(PANDOC) $(PANDOC_PDF_OPTS) $< -o $@

$(HTML_OUT):
	mkdir -p $(HTML_OUT)

$(PDF_OUT):
	mkdir -p $(PDF_OUT)

