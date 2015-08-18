# Makefile for go-cron program (c) 2015 David Rook - all rights reserved

PROG = go-cron
VERSION = 0.0.1
TARDIR = 	$(HOME)/Desktop/TarPit/
DATE = 	`date "+%Y-%m-%d.%H_%M_%S"`
DOCOUT = README-$(PROG)-godoc.md

all:
	go build -v
	go install
# change cp to echo if you really don't want to install the program

install:
	go build -v
	go tool vet .
	go tool vet -shadow .
	gofmt -w *.go
#	go install
#	cp $(PROG) $(HOME)/bin

docs:
	godoc2md . > $(DOCOUT)
	godepgraph -md -p . >> $(DOCOUT)
	deadcode -md >> $(DOCOUT)
	cp README-$(PROG).md README.md
	cat $(DOCOUT) >> README.md
	cp README.md README2.md

neat:
	go fmt ./...

dead:
	deadcode > problems.dead

index:
	cindex .

clean:
	go clean ./...
	rm -f *~ problems.dead count.out README2.md $(DOCOUT)

tar:
	echo $(TARDIR)$(PROG)_$(VERSION)_$(DATE).tar
	tar -ncvf $(TARDIR)$(PROG)_$(VERSION)_$(DATE).tar .
