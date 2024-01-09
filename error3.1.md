3.1) installing nHUSH...
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/readfa.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/pbar.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/atcg.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/util.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/find_abundant.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/eq_classes.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/bitfield.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
gcc -c -Wall -Wextra -std=gnu11 -flto -DNDEBUG -O3 -fno-math-errno  -fopenmp `pkg-config lua --cflags` `pkg-config readline --cflags` src/bfm.c
Package lua was not found in the pkg-config search path.
Perhaps you should add the directory containing `lua.pc'
to the PKG_CONFIG_PATH environment variable
Package 'lua', required by 'virtual:world', not found
Package termcap was not found in the pkg-config search path.
Perhaps you should add the directory containing `termcap.pc'
to the PKG_CONFIG_PATH environment variable
Package 'termcap', required by 'readline', not found
In file included from src/bfm.h:32,
                 from src/bfm.c:1:
src/mindist_gen_mask_lua.h:11:10: fatal error: lua.h: No such file or directory
   11 | #include <lua.h>
      |          ^~~~~~~
compilation terminated.
make: *** [makefile:93: bfm.o] Error 1
./makedeb: line 1: f#!/bin/bash: No such file or directory
pkgdir=/tmp/tmp.Y0QXnXumUl/nhush
pkgver=0.1.0
arch=amd64
Preparing files
cp: cannot stat '/home/zafer.kosar/PRB/nHUSH/bin/nhush': No such file or directory