default : game


sdlml.o : sdlml/sdlml.c
	gcc -DLINUX -O `sdl-config --cflags` -c sdlml/sdlml.c -o sdlml.o

game : sdlml.o *.sml functioning/*.sml examples/starbot/*.sml makefile
	mlton -link-opt "-lSDL_image -ltiff -lpng -ljpeg -lz `sdl-config --libs`" -default-ann 'allowFFI true' -output game.exe examples/starbot/sources.cm sdlml.o

redstar : sdlml.o *.sml functioning/*.sml examples/redstar/*.sml makefile
	mlton -link-opt "-lSDL_image -ltiff -lpng -ljpeg -lz `sdl-config --libs`" -default-ann 'allowFFI true' -output game.exe examples/redstar/sources.cm sdlml.o

clean :
	rm -f core core.* *~ *.exe *.o
