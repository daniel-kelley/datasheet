Datasheet LaTex template

This provides a document class 'datasheet' and a makefile fragment
for building documents with make(1).

Datasheet builds on memoir (https://www.ctan.org/pkg/memoir) for page
layout and lwarp (https://www.ctan.org/pkg/lwarp) for HTML generation.

Page size is hardwired to US letter; fonts are hardwired to STIX.

The margins are expanded, similar to datasheets used by semiconductor
companies, hence the name.

The makefile fragment has four standard targets: all, pdf, html, and clean.
'all' defaults to 'pdf'.

See the stylesheet for other packages included by default.

For images, PDFs need .pdf files, and html needs .svg files, so both
graphic types needs to be supplied - there's no automatic generation
of one to the other.

See https://github.com/daniel-kelley/bwmse for an example of real
usage.
