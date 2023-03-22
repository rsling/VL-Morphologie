# Roland's Make system for LaTeX.

# Compile system.
LX = xelatex
BX = biber


# Project name and file name parts.
PROJECT = SchaeferMorphologieLexikologie
HANDOUTSUFF = Handout
SLIDESUFF = Folien
SUFFSUFF = .pdf
BIBSUFF = .bbl
OUTDIR = output

# TeX Sources to watch.
SOURCES = main.tex $(wildcard includes/*.tex)

# Stuff passed to XeLaTeX.
ALLPARTS = \def\PartOne{}\def\PartTwo{}\def\PartThree{}
HANDOUTDEF = \def\HANDOUT{}
MAININCLUDE = \input{main}

# XeLaTeX flags.
PREFLAGS = -no-pdf
TEXFLAGS = -output-directory=$(OUTDIR)


# Create output dir if needed.
$(info $(shell [ ! -d $(OUTDIR) ] && mkdir -p ./$(OUTDIR)/includes))


# Full document.


# Complete handout BBL.
$(OUTDIR)/$(PROJECT)$(HANDOUTSUFF)$(BIBSUFF): $(SOURCES) bibliography.bib
	$(LX) $(TEXFLAGS) -jobname=$(PROJECT)$(HANDOUTSUFF) $(PREFLAGS) "$(HANDOUTDEF)$(ALLPARTS)$(MAININCLUDE)"
	cd ./$(OUTDIR); $(BX) $(PROJECT)$(HANDOUTSUFF)

# Complete handout PDF.
$(OUTDIR)/$(PROJECT)$(HANDOUTSUFF)$(SUFFSUFF): $(OUTDIR)/$(PROJECT)$(HANDOUTSUFF)$(BIBSUFF)
	$(LX) $(TEXFLAGS) -jobname=$(PROJECT)$(HANDOUTSUFF) "$(HANDOUTDEF)$(ALLPARTS)$(MAININCLUDE)"


# Complete slides BBL.
$(OUTDIR)/$(PROJECT)$(SLIDESUFF)$(BIBSUFF): $(SOURCES) bibliography.bib
	$(LX) $(TEXFLAGS) -jobname=$(PROJECT)$(SLIDESUFF) $(PREFLAGS) "$(ALLPARTS)$(MAININCLUDE)"
	cd ./$(OUTDIR); $(BX) $(PROJECT)$(SLIDESUFF)


# Complete slides PDF.
$(OUTDIR)/$(PROJECT)$(SLIDESUFF)$(SUFFSUFF): $(OUTDIR)/$(PROJECT)$(SLIDESUFF)$(BIBSUFF)
	$(LX) $(TEXFLAGS) -jobname=$(PROJECT)$(SLIDESUFF) "$(ALLPARTS)$(MAININCLUDE)"



# Individual parts.


# Handout BBL.
$(OUTDIR)/$(PROJECT)Part%$(HANDOUTSUFF)$(BIBSUFF): $(SOURCES) bibliography.bib
	$(LX) $(TEXFLAGS) $(PREFLAGS) -jobname=$(PROJECT)Part$*$(HANDOUTSUFF) "$(HANDOUTDEF)\def\Part$*{}\def\TITLE{ --- Part $*}$(MAININCLUDE)"
	cd ./$(OUTDIR); $(BX) $(PROJECT)Part$*$(HANDOUTSUFF)


# Handout PDF.
$(OUTDIR)/$(PROJECT)Part%$(HANDOUTSUFF)$(SUFFSUFF): $(OUTDIR)/$(PROJECT)Part%$(HANDOUTSUFF)$(BIBSUFF)
	$(LX) $(TEXFLAGS) -jobname=$(PROJECT)Part$*$(HANDOUTSUFF) "$(HANDOUTDEF)\def\Part$*{}\def\TITLE{ --- Part $*}$(MAININCLUDE)"



# Slides BBL.
$(OUTDIR)/$(PROJECT)Part%$(SLIDESUFF)$(BIBSUFF): $(SOURCES) bibliography.bib
	$(LX) $(TEXFLAGS) $(PREFLAGS) -jobname=$(PROJECT)Part$*$(SLIDESUFF) "\def\Part$*{}\def\TITLE{ --- Part $*}$(MAININCLUDE)"
	cd ./$(OUTDIR); $(BX) $(PROJECT)Part$*$(SLIDESUFF)


# Slides PDF.
$(OUTDIR)/$(PROJECT)Part%$(SLIDESUFF)$(SUFFSUFF): $(OUTDIR)/$(PROJECT)Part%$(SLIDESUFF)$(BIBSUFF)
	$(LX) $(TEXFLAGS) -jobname=$(PROJECT)Part$*$(SLIDESUFF) "\def\Part$*{}\def\TITLE{ --- Part $*}$(MAININCLUDE)"



# Phony shit.


.PHONY: oneslides twoslides threeslides onehandout twohandout threehandout individualslides individualhandout individual handout slides full allslides allhandout all clean realclean edit

all: allslides allhandout


oneslides: $(OUTDIR)/$(PROJECT)PartOne$(SLIDESUFF)$(SUFFSUFF)

twoslides: $(OUTDIR)/$(PROJECT)PartTwo$(SLIDESUFF)$(SUFFSUFF)

threeslides: $(OUTDIR)/$(PROJECT)PartThree$(SLIDESUFF)$(SUFFSUFF)


onehandout: $(OUTDIR)/$(PROJECT)PartOne$(HANDOUTSUFF)$(SUFFSUFF)

twohandout: $(OUTDIR)/$(PROJECT)PartTwo$(HANDOUTSUFF)$(SUFFSUFF)

threehandout: $(OUTDIR)/$(PROJECT)PartThree$(HANDOUTSUFF)$(SUFFSUFF)


individualslides: oneslides twoslides threeslides

individualhandout: onehandout twohandout threehandout

individual: individualslides individualhandout


handout: $(OUTDIR)/$(PROJECT)$(HANDOUTSUFF)$(SUFFSUFF)

slides: $(OUTDIR)/$(PROJECT)$(SLIDESUFF)$(SUFFSUFF)

full: handout slides


allslides: individualslides slides

allhandout: individualhandout handout


clean:
	cd ./$(OUTDIR)/; \rm -f *.adx *.and *.aux *.bbl *.blg *.idx *.ilg *.ldx *.lnd *.log *.out *.rdx *.run.xml *.sdx *.snd *.toc *.wdx *.xdv *.nav *.snm *.bcf *.vrb
	cd ./$(OUTDIR)/includes/; \rm -f *.aux


realclean: clean
	cd ./$(OUTDIR)/; \rm -f *.pdf


edit:
	mvim -c ':set spell spelllang=en' -c ':nnoremap <F15> ]s' -c ':nnoremap <F14> [s' main.tex includes/*.tex
