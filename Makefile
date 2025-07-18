##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Sat Jun 21 17:31:54 PDT 2025
## Last Modified: Sat Jun 21 17:31:57 PDT 2025
## Syntax:        GNU Makefile
##
## Description:   Does various tasks on the FDS dataset repository files.
##
##                Internal use:
##                   make
##                or
##                   make kern
##                copies Humdrum kern files from the RDS and TDS repositories
##                in the same directory as the FDS repository.  Humdrum files
##                should not be edited in this repository since they are edited
##                in the RDS/TDS repositories (and should be updated with this
##                make command to update the digital scores in the kern directory.
##
##                Automatically create MIDI files from the kern files.  You
##                must first install verovio (https://verovio.humdrum.org).
##                   make midi
##                Automatically create MEI files from the kern files.  You
##                must first install verovio (https://verovio.humdrum.org).
##                   make mei
##                Automatically create MusicXML files from the kern files. 
##                This can also be done with Converter21 in Python:
##                   make musicxml
##

.PHONY: kern midi mei musicxml

SHELL := /bin/bash


all:
	@echo
	@echo "make midi             == Create MIDI files in midi subdirectory"
	@echo "make mei              == Create MEI files in mei subdirectory"
	@echo "make musicxml         == Create MusicXML files in musicxml subdirectory"
	@echo "make all-conversions  == Create MIDI, MEI, and MusicXML files"
	@echo


kern:
	mkdir -p kern
	-rm -rf kern/*.krn
	cp ../rds-scores/kern/*.krn kern
	cp ../tds-scores/kern/*.krn kern


all-conversions: midi mei musicxml

midi:
	mkdir -p midi
	-rm -rf midi/*.mid
	for file in kern/*krn; \
	do \
		verovio $$file -tmidi -o midi/$$(basename $$file .krn).mid; \
	done


mei:
	mkdir -p mei
	-rm -rf midi/*.mei
	for file in kern/*krn; \
	do \
		echo Creating mei/$$(basename $$file .krn).mei; \
		verovio $$file -tmei -o mei/$$(basename $$file .krn).mei; \
	done


musicxml:
	mkdir -p musicxml
	-rm -rf midi/*.musicxml
	for file in kern/*krn; \
	do \
		echo Creating musicxml/$$(basename $$file .krn).musicxml; \
		PERL_LWP_SSL_VERIFY_HOSTNAME=0 humdrum2musicxml $$file > musicxml/$$(basename $$file .krn).musicxml; \
	done


clean:
	-rm -rf midi
	-rm -rf mei
	-rm -rf musicxml


##############################
##
## FDS is a merger of RDS and TDS files in the kern directory.  Updates to the files
##    should be done in those two repositories rather than here, and then the "make copy"
##    command should copy the two repositories' kern files into the kern directory.
##

make copy:
	-rm kern/*.krn
	cp ../rds-scores/kern/*.krn kern/
	cp ../tds-scores/kern/*.krn kern/



##############################
##
## Musical Features
##

hp: highest-pitch
highest-pitch:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-highest-pitch)


lp: lowest-pitch
lowest-pitch:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-lowest-pitch)


mp: mean-pitch
mean-pitch:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-mean-pitch)


# composte-events-count not used anymore (use event-counts, which this is the first column there).
cec: composite-events-count
composite-events-count:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-composite-events-count)


ec: event-counts
event-counts:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-event-counts)


edr: event-density-ratio
event-density-ratio:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-event-density-ratio)


nr: nested-ratio
nested-ratio:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-nested-ratio)
	

sd: sonority-dissonance
sonority-dissonance:
	@(cd kern && cat ../bin/ids.txt | ../bin/get-sonority-dissonance)


