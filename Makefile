# Roland's Make system for LaTeX.

# Compile system.
LX = xelatex
BX = biber

# Project name and file name parts.
PROJECT = SchaeferMorphologieLexikologie
HANDOUTSUFF = _Handout_
SLIDESUFF = _Folien_
SUFFSUFF = .pdf
BIBSUFF = .bbl
OUTDIR = output
BIBFILE = /Users/roland/Workingcopies/Bibtex/rs.bib

# TeX Sources to watch.
SOURCEDIR = includes/
SOURCES = main.tex $(wildcard $(SOURCEDIR)/*.tex)

# Stuff passed to XeLaTeX.
HANDOUTDEF = \def\HANDOUT{}
SLIDEDEF =
MAININCLUDE = \input{main}

# XeLaTeX flags.
PREFLAGS = -no-pdf
TEXFLAGS = -output-directory=$(OUTDIR)

# Create output dir if needed.
$(info $(shell [ ! -d $(OUTDIR) ] && mkdir -p ./$(OUTDIR)/includes))


# Individual handout BBL and PDF.
$(OUTDIR)/%$(HANDOUTSUFF)$(PROJECT)$(BIBSUFF): main.tex $(SOURCEDIR)/%.tex $(BIBFILE)
	$(LX) $(TEXFLAGS) $(PREFLAGS) -jobname=$*$(HANDOUTSUFF)$(PROJECT) "$(HANDOUTDEF)\def\TITLE{$*}$(MAININCLUDE)"
	cd ./$(OUTDIR); $(BX) $*$(HANDOUTSUFF)$(PROJECT)

$(OUTDIR)/%$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF): main.tex $(SOURCEDIR)%.tex $(OUTDIR)/%$(HANDOUTSUFF)$(PROJECT)$(BIBSUFF)
	$(LX) $(TEXFLAGS) -jobname=$*$(HANDOUTSUFF)$(PROJECT) "$(HANDOUTDEF)\def\TITLE{$*}$(MAININCLUDE)"

# Individual slides BBL and PDF.
$(OUTDIR)/%$(SLIDESUFF)$(PROJECT)$(BIBSUFF): main.tex $(SOURCEDIR)%.tex $(BIBFILE)
	$(LX) $(TEXFLAGS) $(PREFLAGS) -jobname=$*$(SLIDESUFF)$(PROJECT) "$(SLIDEDEF)\def\TITLE{$*}$(MAININCLUDE)"
	cd ./$(OUTDIR); $(BX) $*$(SLIDESUFF)$(PROJECT)

$(OUTDIR)/%$(SLIDESUFF)$(PROJECT)$(SUFFSUFF): main.tex $(SOURCEDIR)%.tex $(OUTDIR)/%$(SLIDESUFF)$(PROJECT)$(BIBSUFF)
	$(LX) $(TEXFLAGS) -jobname=$*$(SLIDESUFF)$(PROJECT) "$(SLIDEDEF)\def\TITLE{$*}$(MAININCLUDE)"

# Phony shit.

.PHONY: handout01 handout02 handout03 handout04 handout05 handout06 handout07 handout08 handout09 handout10 slides01 slides02 slides03 slides04 slides05 slides06 slides07 slides08 slides09 slides10 allhandouts allslides all clean realclean edit

handout01: $(OUTDIR)/01.+Grammatik+und+Lehramt$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout02: $(OUTDIR)/02.+Morphologie+und+Grundbegriffe$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout03: $(OUTDIR)/03.+Wortklassen$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout04: $(OUTDIR)/04.+Komposition$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout05: $(OUTDIR)/05.+Derivation+und+Konversion$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout06: $(OUTDIR)/06.+Nominalflexion$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout07: $(OUTDIR)/07.+Verbalflexion$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout08: $(OUTDIR)/08.+Valenz$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout09: $(OUTDIR)/09.+Verbtypen$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
handout10: $(OUTDIR)/10.+Kernwortschatz+und+Fremdwort$(HANDOUTSUFF)$(PROJECT)$(SUFFSUFF)
allhandouts: handout01 handout02 handout03 handout04 handout05 handout06 handout07 handout08 handout09 handout10

slides01: $(OUTDIR)/01.+Grammatik+und+Lehramt$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides02: $(OUTDIR)/02.+Morphologie+und+Grundbegriffe$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides03: $(OUTDIR)/03.+Wortklassen$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides04: $(OUTDIR)/04.+Komposition$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides05: $(OUTDIR)/05.+Derivation+und+Konversion$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides06: $(OUTDIR)/06.+Nominalflexion$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides07: $(OUTDIR)/07.+Verbalflexion$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides08: $(OUTDIR)/08.+Valenz$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides09: $(OUTDIR)/09.+Verbtypen$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
slides10: $(OUTDIR)/10.+Kernwortschatz+und+Fremdwort$(SLIDESUFF)$(PROJECT)$(SUFFSUFF)
allslides: slides01 slides02 slides03 slides04 slides05 slides06 slides07 slides08 slides09 slides10

all: allhandouts allslides

clean:
	cd ./$(OUTDIR)/; \rm -f *.adx *.and *.aux *.bbl *.blg *.idx *.ilg *.ldx *.lnd *.log *.out *.rdx *.run.xml *.sdx *.snd *.toc *.wdx *.xdv *.nav *.snm *.bcf *.vrb
	cd ./$(OUTDIR)/includes/; \rm -f *.aux

edit:
	mvim -c ':set spell spelllang=en' -c ':nnoremap <F15> ]s' -c ':nnoremap <F14> [s' main.tex includes/*.tex


