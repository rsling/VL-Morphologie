LX = xelatex
BX = biber

PREFLAGS = -no-pdf
TEXFLAGS = -output-directory=output
HANDIFLAGS = \def\HANDOUT{}
FINALFLAGS = \input{main}
FILEPRE = SchaeferMorpholexikologie
HOSUFF = Handout
PRESUFF = Presentation

H01JOB = $(FILEPRE)01$(HOSUFF)
P01JOB = $(FILEPRE)01$(PRESUFF)
L01FLAGS = \def\TITLE{1. Lexikon und Morphologie}\def\LECTURE{01}

H02JOB = $(FILEPRE)02$(HOSUFF)
P02JOB = $(FILEPRE)02$(PRESUFF)
L02FLAGS = \def\TITLE{2. Wörter und Wortstruktur}\def\LECTURE{02}

H03JOB = $(FILEPRE)03$(HOSUFF)
P03JOB = $(FILEPRE)03$(PRESUFF)
L03FLAGS = \def\TITLE{3. Wortklassen}\def\LECTURE{03}

FULLJOB = $(FILEPRE)Handout


create:
	mkdir -p ./output/includes

all: handouts presentations
handouts: h01 h02 h03
presentations: p01 p02 p03

allq: handoutsq presentationsq
handoutsq: h01q h02q h03q
presentationsq: p01q p02q p03q

h01: create
	$(LX) $(TEXFLAGS) -jobname=$(H01JOB) $(PREFLAGS) "$(L01FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"
	cd ./output; $(BX) $(H01JOB)
	$(LX) $(TEXFLAGS) -jobname=$(H01JOB) "$(L01FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"

h01q: create
	$(LX) $(TEXFLAGS) -jobname=$(H01JOB) "$(L01FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"

p01: create
	$(LX) $(TEXFLAGS) -jobname=$(P01JOB) $(PREFLAGS) "$(L01FLAGS)$(FINALFLAGS)"
	cd ./output; $(BX) $(P01JOB)
	$(LX) $(TEXFLAGS) -jobname=$(P01JOB) "$(L01FLAGS)$(FINALFLAGS)"

p01q: create
	$(LX) $(TEXFLAGS) -jobname=$(P01JOB) "$(L01FLAGS)$(FINALFLAGS)"

h02: create
	$(LX) $(TEXFLAGS) -jobname=$(H02JOB) $(PREFLAGS) "$(L02FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"
	cd ./output; $(BX) $(H02JOB)
	$(LX) $(TEXFLAGS) -jobname=$(H02JOB) "$(L02FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"

h02q: create
	$(LX) $(TEXFLAGS) -jobname=$(H02JOB) "$(L02FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"

p02: create
	$(LX) $(TEXFLAGS) -jobname=$(P02JOB) $(PREFLAGS) "$(L02FLAGS)$(FINALFLAGS)"
	cd ./output; $(BX) $(P02JOB)
	$(LX) $(TEXFLAGS) -jobname=$(P02JOB) "$(L02FLAGS)$(FINALFLAGS)"

p02q: create
	$(LX) $(TEXFLAGS) -jobname=$(P02JOB) "$(L02FLAGS)$(FINALFLAGS)"

h03: create
	$(LX) $(TEXFLAGS) -jobname=$(H03JOB) $(PREFLAGS) "$(L03FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"
	cd ./output; $(BX) $(H03JOB)
	$(LX) $(TEXFLAGS) -jobname=$(H03JOB) "$(L03FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"

h03q: create
	$(LX) $(TEXFLAGS) -jobname=$(H03JOB) "$(L03FLAGS)$(HANDIFLAGS)$(FINALFLAGS)"

p03: create
	$(LX) $(TEXFLAGS) -jobname=$(P03JOB) $(PREFLAGS) "$(L03FLAGS)$(FINALFLAGS)"
	cd ./output; $(BX) $(P03JOB)
	$(LX) $(TEXFLAGS) -jobname=$(P03JOB) "$(L03FLAGS)$(FINALFLAGS)"

p03q: create
	$(LX) $(TEXFLAGS) -jobname=$(P03JOB) "$(L03FLAGS)$(FINALFLAGS)"

full: create
	$(LX) $(TEXFLAGS) -jobname=$(FULLJOB) $(PREFLAGS) "$(HANDIFLAGS)$(FINALFLAGS)"
	cd ./output; $(BX) $(FULLJOB)
	$(LX) $(TEXFLAGS) -jobname=$(FULLJOB) "$(HANDIFLAGS)$(FINALFLAGS)"

fullq: create
	$(LX) $(TEXFLAGS) -jobname=$(FULLJOB) "$(HANDIFLAGS)$(FINALFLAGS)"

clean:
	cd ./output/; \rm -f *.adx *.and *.aux *.bbl *.blg *.idx *.ilg *.ldx *.lnd *.log *.out *.rdx *.run.xml *.sdx *.snd *.toc *.wdx *.xdv *.nav *.snm *.bcf *.vrb
	cd ./output/includes/; \rm -f *.aux

edit:
	mvim -c ':set spell spelllang=de' -c ':nnoremap <F15> ]s' -c ':nnoremap <F14> [s' main.tex includes/*.tex
