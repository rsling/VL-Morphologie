# Roland's Make system for LaTeX.

# Compile system.
LX = xelatex

# Project name and file name parts.
PROJECT = SchaeferMorphologieUebungen
OUTDIR = output

# TeX Sources to watch.
SOURCEDIR = includes/
SOURCES = main.tex $(wildcard $(SOURCEDIR)/*.tex)

# Stuff passed to XeLaTeX.
MAININCLUDE = \input{main}
MULOE=\def\SOLUTIONS{}

# XeLaTeX flags.
TEXFLAGS = -output-directory=$(OUTDIR)

INPUT01=\def\LEKTION{01}\def\TITLE{01 | Satzglieder}\input{uebung.tex}
INPUT02=\def\LEKTION{02}\def\TITLE{02 | Stämme und Affixe}\input{uebung.tex}
INPUT03=\def\LEKTION{03}\def\TITLE{03 | Wortklassen}\input{uebung.tex}
INPUT04=\def\LEKTION{04}\def\TITLE{04 | Komposition}\input{uebung.tex}
INPUT05=\def\LEKTION{05}\def\TITLE{05 | Derivation}\input{uebung.tex}
INPUT06=\def\LEKTION{06}\def\TITLE{06 | Flexion der Nomina}\input{uebung.tex}
INPUT07=\def\LEKTION{07}\def\TITLE{07 | Flexion der Adjektive und Verben}\input{uebung.tex}
INPUT08=\def\LEKTION{08}\def\TITLE{08 | Valenz}\input{uebung.tex}
INPUT09=\def\LEKTION{09}\def\TITLE{09 | Verbtypen}\input{uebung.tex}
INPUT10=\def\LEKTION{10}\def\TITLE{10 | Kernwortschatz}\input{uebung.tex}

INPUTVB=\def\LEKTION{verben}\def\TITLE{Repetitorium zur Verbflexion}\input{uebung.tex}

# Create output dir if needed.
$(info $(shell [ ! -d $(OUTDIR) ] && mkdir -p ./$(OUTDIR)/includes))


# Phony shit.

.PHONY: uebung01 uebung02 uebung03 uebung04 uebung05 uebung06 uebung07 uebung08 uebung09 uebung10 muloe01 muloe02 muloe03 muloe04 muloe05 muloe06 muloe07 muloe08 muloe09 muloe10 verben muloeverben all

uebung01:
	$(LX) -no-pdf -jobname=$(PROJECT)01 $(TEXFLAGS) "$(INPUT01)"
	$(LX) -jobname=$(PROJECT)01 $(TEXFLAGS) "$(INPUT01)"

uebung02:
	$(LX) -no-pdf -jobname=$(PROJECT)02 $(TEXFLAGS) "$(INPUT02)"
	$(LX) -jobname=$(PROJECT)02 $(TEXFLAGS) "$(INPUT02)"

uebung03:
	$(LX) -no-pdf -jobname=$(PROJECT)03 $(TEXFLAGS) "$(INPUT03)"
	$(LX) -jobname=$(PROJECT)03 $(TEXFLAGS) "$(INPUT03)"

uebung04:
	$(LX) -no-pdf -jobname=$(PROJECT)04 $(TEXFLAGS) "$(INPUT04)"
	$(LX) -jobname=$(PROJECT)04 $(TEXFLAGS) "$(INPUT04)"

uebung05:
	$(LX) -no-pdf -jobname=$(PROJECT)05 $(TEXFLAGS) "$(INPUT05)"
	$(LX) -jobname=$(PROJECT)05 $(TEXFLAGS) "$(INPUT05)"

uebung06:
	$(LX) -no-pdf -jobname=$(PROJECT)06 $(TEXFLAGS) "$(INPUT06)"
	$(LX) -jobname=$(PROJECT)06 $(TEXFLAGS) "$(INPUT06)"

uebung07:
	$(LX) -no-pdf -jobname=$(PROJECT)07 $(TEXFLAGS) "$(INPUT07)"
	$(LX) -jobname=$(PROJECT)07 $(TEXFLAGS) "$(INPUT07)"

uebung08:
	$(LX) -no-pdf -jobname=$(PROJECT)08 $(TEXFLAGS) "$(INPUT08)"
	$(LX) -jobname=$(PROJECT)08 $(TEXFLAGS) "$(INPUT08)"

uebung09:
	$(LX) -no-pdf -jobname=$(PROJECT)09 $(TEXFLAGS) "$(INPUT09)"
	$(LX) -jobname=$(PROJECT)09 $(TEXFLAGS) "$(INPUT09)"

uebung10:
	$(LX) -no-pdf -jobname=$(PROJECT)10 $(TEXFLAGS) "$(INPUT10)"
	$(LX) -jobname=$(PROJECT)10 $(TEXFLAGS) "$(INPUT10)"

verben:
	$(LX) -no-pdf -jobname=$(PROJECT)Verben $(TEXFLAGS) "$(INPUTVB)"
	$(LX) -jobname=$(PROJECT)Verben $(TEXFLAGS) "$(INPUTVB)"

muloe01:
	$(LX) -no-pdf -jobname=$(PROJECT)01Muloe $(TEXFLAGS) "$(MULOE)$(INPUT01)"
	$(LX) -jobname=$(PROJECT)01Muloe $(TEXFLAGS) "$(MULOE)$(INPUT01)"

muloe02:
	$(LX) -no-pdf -jobname=$(PROJECT)02Muloe $(TEXFLAGS) "$(MULOE)$(INPUT02)"
	$(LX) -jobname=$(PROJECT)02Muloe $(TEXFLAGS) "$(MULOE)$(INPUT02)"

muloe03:
	$(LX) -no-pdf -jobname=$(PROJECT)03Muloe $(TEXFLAGS) "$(MULOE)$(INPUT03)"
	$(LX) -jobname=$(PROJECT)03Muloe $(TEXFLAGS) "$(MULOE)$(INPUT03)"

muloe04:
	$(LX) -no-pdf -jobname=$(PROJECT)04Muloe $(TEXFLAGS) "$(MULOE)$(INPUT04)"
	$(LX) -jobname=$(PROJECT)04Muloe $(TEXFLAGS) "$(MULOE)$(INPUT04)"

muloe05:
	$(LX) -no-pdf -jobname=$(PROJECT)05Muloe $(TEXFLAGS) "$(MULOE)$(INPUT05)"
	$(LX) -jobname=$(PROJECT)05Muloe $(TEXFLAGS) "$(MULOE)$(INPUT05)"

muloe06:
	$(LX) -no-pdf -jobname=$(PROJECT)06Muloe $(TEXFLAGS) "$(MULOE)$(INPUT06)"
	$(LX) -jobname=$(PROJECT)06Muloe $(TEXFLAGS) "$(MULOE)$(INPUT06)"

muloe07:
	$(LX) -no-pdf -jobname=$(PROJECT)07Muloe $(TEXFLAGS) "$(MULOE)$(INPUT07)"
	$(LX) -jobname=$(PROJECT)07Muloe $(TEXFLAGS) "$(MULOE)$(INPUT07)"

muloe08:
	$(LX) -no-pdf -jobname=$(PROJECT)08Muloe $(TEXFLAGS) "$(MULOE)$(INPUT08)"
	$(LX) -jobname=$(PROJECT)08Muloe $(TEXFLAGS) "$(MULOE)$(INPUT08)"

muloe09:
	$(LX) -no-pdf -jobname=$(PROJECT)09Muloe $(TEXFLAGS) "$(MULOE)$(INPUT09)"
	$(LX) -jobname=$(PROJECT)09Muloe $(TEXFLAGS) "$(MULOE)$(INPUT09)"

muloe10:
	$(LX) -no-pdf -jobname=$(PROJECT)10Muloe $(TEXFLAGS) "$(MULOE)$(INPUT10)"
	$(LX) -jobname=$(PROJECT)10Muloe $(TEXFLAGS) "$(MULOE)$(INPUT10)"

muloeverben:
	$(LX) -no-pdf -jobname=$(PROJECT)VerbenMuloe $(TEXFLAGS) "$(MULOE)$(INPUTVB)"
	$(LX) -jobname=$(PROJECT)VerbenMuloe $(TEXFLAGS) "$(MULOE)$(INPUTVB)"


all:	uebung01 uebung02 uebung03 uebung04 uebung05 uebung06 uebung07 uebung08 uebung09 uebung10 verben muloe01 muloe02 muloe03 muloe04 muloe05 muloe06 muloe07 muloe08 muloe09 muloe10 muloeverben


clean:
	cd ./output; rm -f *.adx *.and *.aux *.bbl *.blg *.idx *.ilg *.ldx *.lnd *.log *.out *.rdx *.run.xml *.sdx *.snd *.toc *.wdx *.xdv *.nav *.snm *.bcf *.vrb

