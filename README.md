# basbolt-image
This repository builds a compatible DOS disk image, basbolt.img, containing [Basbolt](https://github.com/parkertomatoes/basbolt) 's DOS compilation server. The disk image also includes an installation of FreeDOS which automatically runs the Basbolt server (SERVER.EXE), as well as one or more installations of QuickBASIC. 

## Building basbolt.img
Package all desired QuickBASIC compilers in `/opt/qb`. Each version should be in a separate subfolder. The Basbolt server will assume the following naming scheme:
 * QB30 - QuickBASIC 3.0
 * QB40 - QuickBASIC 4.0
 * QB45 - QuickBASIC 4.5
 * PDS71 - Professional Development System 7.1
 * VBD10 - Visual BASIC for DOS 1.0
For instance, QuickBASIC 4.5 should be installed in `/opt/qb/QB45`.

QuickBASIC 4.5 must be included, as it is used by the Makefile to build the Basbolt server (SERVER.EXE)

To build, dosbox, mtools, make, and gzip must be installed. They can be installed with all major package managers, including apt, yum, and brew. Then, run `make`. This builds `build/basbolt.img`

## Using
Copy `build/basbolt.img` to the `images` subfolder of your cloned Basbolt repository.

## License
The Basbolt server source code, server.bas, as well as the Makefile are distributed with an MIT license. 

This repository includes a compressed FAT disk image containing a FreeDOS installation with no source changes. FreeDOS sources, which are GPL2 licensed, are available on this same domain (Github): https://github.com/FDOS.

QuickBASIC, Professional Development System, and Visual BASIC for DOS are all proprietary software owned by Microsoft, and not distributed from this repository.