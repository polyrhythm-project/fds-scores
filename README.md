

Polyrhythm Project FDS Dataset
=================================

The FDS (Full dataset) for the Polyrhythm Project.

The [kern](https://github.com/polyrhythm-project/fds-scores/tree/main/kern)
directory contains the digital scores, currently consisting of 710 examples.

Files in the
[kern](https://github.com/polyrhythm-project/fds-scores/tree/main/kern)
directory that start with `R` are the Reserve dataset, which is a
random sample of four examples for each of the 20 composers represented
in the Full dataset (plus four additional examples marked with an
`x` after the example number which are for piano reductions of the
respective example.

Other files are prefixed with `T` to indicate they are from the Test dataset.

Data conversions
================

The Humdrum kern files can be converted to MIDI, MEI or MusicXML data.  See
the [Makefile](https://github.com/polyrhythm-project/fds-scores/blob/main/Makefile)
for examples of how to do this.  For MIDI and MEI, use [verovio](https://verovio.org].
For MusicXML use [Converter21](https://github.com/gregchapman-dev/converter21) in Python.


Filename structure
==================

Example:

`R129_Jan-w30p11m124-127.krn`

| component | meaning |
| --- | --- |
| `R`  | file is from the Reserve dataset (otherwise prefixed with `T` for the Test dataset |
| `129` | example number for the digital score |
| `187x` | the `x` indicates a piano reduction of the matching full score (4 cases) |
| `Jan` | the composer code (Leoš Janáček in this case |
| `w30` | 30th work by Janáček represented in the Full dataset |
| `p11m124-127` | example is on page 11 from measure 124–127 in the reference edition |
| `.krn` | file extension for kern Humdrum data.  The graphical notation of the digital scores can be viewed at the bottom of the website example pages (https://polyrhythm.humdrum.org/example/?id=129 in this case), or copied into the text editor of [VHV](https://verovio.humdrum.org?file=https://github.com/polyrhythm-project/fds-scores/blob/main/kern/R129_Jan-w30p11m124-127.krn) |




Other resources
==================

| Resource | Link |
| --- | --- |
|  Website frontend | https://polyrhythm.humdrum.org |
|  Sample example page | https://polyrhythm.humdrum.org/example/?id=517 |
|  Metadata (JSON)  | https://script.google.com/macros/s/AKfycbzcGajdIOFmC0ZpVXNgSfNdPFubSAYeo-_ltUmNV3_R0d4Siy1Dofc8e7XWbfd8Ax9MNg/exec |
| Browse page (based on metadata) | https://polyrhythm.humdrum.org/browse |
| Reference editions (JSON) |  https://script.google.com/macros/s/AKfycbzumkvS65CsktdjD7s8JGPxc_e-ISZjkG8XADKJDpcTdRknrtphdODQjkfpy-Xm9fLgmA/exec |
| Reference editions page | https://polyrhythm.humdrum.org/scores |
| Reference recordings (JSON) | https://script.google.com/macros/s/AKfycbzumkvS65CsktdjD7s8JGPxc_e-ISZjkG8XADKJDpcTdRknrtphdODQjkfpy-Xm9fLgmA/exec|
| Reference recordings page | https://polyrhythm.humdrum.org/recordings |
| Publications | https://polyrhythm.humdrum.org/publications |
| Presentations | https://polyrhythm.humdrum.org/presentations |
| Maps | https://polyrhythm.humdrum.org/maps |


