BC:=A:\OPT\QB\QB45\BC.EXE
LINK:=A:\OPT\QB\QB45\LINK.EXE
BCOM45:=A:\OPT\QB\QB45\LIB\BCOM45.LIB

all: build/basbolt.img

build/basbolt.img: opt/img/basbolt.img.gz build/SERVER.EXE
	gzip -dkc opt/img/basbolt.img.gz > build/basbolt.img
	mcopy -i build/basbolt.img -s opt/qb/* ::
	mcopy -i build/basbolt.img build/SERVER.EXE ::

build/SERVER.EXE: build/SERVER.OBJ
	SDL_VIDEODRIVER=dummy dosbox \
	  -exit \
	  -c "MOUNT A ." \
	  -c "${LINK} A:\BUILD\SERVER.OBJ,A:\BUILD\SERVER.EXE,NUL,${BCOM45},NUL" \
	  -c "EXIT" \
	  -noconsole >/dev/null

build/SERVER.OBJ: src/server.bas | build
	SDL_VIDEODRIVER=dummy dosbox \
	  -exit \
	  -c "MOUNT A ." \
	  -c "${BC} /A /O A:\SRC\SERVER.BAS A:\BUILD\SERVER.OBJ A:\BUILD\SERVER.LST" \
	  -c "EXIT" \
	  -noconsole >/dev/null

build:
	mkdir -p build

clean:
	rm -rf build

.PHONY: all clean
