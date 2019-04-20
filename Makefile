TARGET = main
PDFVIEWER=chrome

.PHONY : clean all open

all : clean $(patsubst %,%.pdf,$(TARGET)) open

clean :
	for i in aux log bbl blg bcf out run.xml pdf; do \
		rm -f $(patsubst %,%.$$i,$(TARGET)); \
	done
	-rm -f *~

# You may append other dependencies
%.pdf : %.tex
	xelatex $<

open:
open : $(TARGET).pdf
	$(PDFVIEWER) $(shell pwd)/$(TARGET).pdf &