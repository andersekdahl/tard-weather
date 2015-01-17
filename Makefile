TARGNAME = weatherservice
NIM = nim
NIMOPT = c -d:ssl

all: build

bin:
	mkdir bin

clean:
	rm -rf bin

move: bin
	mv src/${TARGNAME} bin/${TARGNAME}

weatherservice:
	${NIM} ${NIMOPT} src/${TARGNAME}.nim

run: bin build_run move

build_run:
	${NIM} ${NIMOPT} -r src/${TARGNAME}.nim

build: clean bin ${TARGNAME}


.PHONY : clean run build build_run move
