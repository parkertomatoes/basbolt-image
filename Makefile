BC:=C:\OPT\QB\QB45\BC.EXE
LINK:=C:\OPT\QB\QB45\LINK.EXE
BCOM45:=C:\OPT\QB\QB45\LIB\BCOM45.LIB

all: build/basbolt.img

build/basbolt.img: opt/img/basbolt.img.gz build/SERVER.EXE
	gzip -dkc opt/img/basbolt.img.gz > build/basbolt.img
	echo drive c: file=\"build/basbolt.img\" partition=1>build/mtoolsrc.conf 
	MTOOLSRC=build/mtoolsrc.conf mcopy -s opt/qb/* C:
	MTOOLSRC=build/mtoolsrc.conf mcopy build/SERVER.EXE C:

build/SERVER.EXE: build/SERVER.OBJ
	SDL_VIDEODRIVER=dummy dosbox \
	  -exit \
	  -c "MOUNT C ." \
	  -c "${LINK} C:\BUILD\SERVER.OBJ,C:\BUILD\SERVER.EXE,NUL,${BCOM45},NUL" \
	  -c "EXIT" \
	  -noconsole >/dev/null

build/SERVER.OBJ: src/server.bas | build
	SDL_VIDEODRIVER=dummy dosbox \
	  -exit \
	  -c "MOUNT C ." \
	  -c "${BC} /A /O C:\SRC\SERVER.BAS C:\BUILD\SERVER.OBJ C:\BUILD\SERVER.LST" \
	  -c "EXIT" \
	  -noconsole >/dev/null

build:
	mkdir -p build

clean:
	rm -rf build

.PHONY: all clean
