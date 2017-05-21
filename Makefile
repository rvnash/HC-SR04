BINDIR=bin
EXAMPLEDIR=examples
LIBDIR=src
TARGET=photon
TARGET_VERSION=0.6.2
DEVICE=tester

$(BINDIR)/examples.bin: $(wildcard $(EXAMPLEDIR)/usage/*.ino) $(wildcard $(LIBDIR)/*)
	mkdir -p $(BINDIR)
	particle compile $(TARGET) --target $(TARGET_VERSION) $(EXAMPLEDIR) --saveTo $(BINDIR)/examples.bin

flash: $(BINDIR)/examples.bin
	particle flash $(DEVICE) $(BINDIR)/examples.bin

clean:
	rm -f $(BINDIR)/*.bin *~
