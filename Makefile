# Makefile for converting Markdown to PDF, HTML, and EPUB

PANDOC = pandoc
SRC = index.md
DIST_DIR = dist
PDF_OUT = $(DIST_DIR)/我们时代的神经与精神疾病.pdf
HTML_OUT = $(DIST_DIR)/我们时代的神经与精神疾病.html
EPUB_OUT = $(DIST_DIR)/我们时代的神经与精神疾病.epub
FONT = LXGW WenKai

# PDF flags based on the successful manual execution
PDF_FLAGS = --pdf-engine=xelatex \
            -V mainfont="$(FONT)" \
            -V CJKmainfont="$(FONT)" \
            -V geometry:margin=1in \
            -V header-includes="\usepackage{graphicx} \usepackage{tikz} \let\oldmaketitle\maketitle \renewcommand{\maketitle}{\begin{titlepage}\begin{tikzpicture}[remember picture,overlay] \node[inner sep=0pt] at (current page.center) {\includegraphics[width=\paperwidth,height=\paperheight]{cover.jpg}}; \end{tikzpicture}\end{titlepage}\clearpage\oldmaketitle} \setkeys{Gin}{width=0.9\textwidth,height=0.8\textheight,keepaspectratio}"

.PHONY: all pdf html clean epub init

all: pdf html epub

# Initialize output directory
init:
	mkdir -p $(DIST_DIR)

pdf: init $(PDF_OUT)

$(PDF_OUT): $(SRC)
	$(PANDOC) $(SRC) -o "$@" $(PDF_FLAGS)

html: init $(HTML_OUT)

$(HTML_OUT): $(SRC)
	$(PANDOC) $(SRC) -o "$@" --embed-resources --standalone

epub: init $(EPUB_OUT)

$(EPUB_OUT): $(SRC)
	$(PANDOC) $(SRC) -o "$@" --epub-cover-image=cover.jpg

clean:
	rm -rf $(DIST_DIR)
