CC=gcc -c
CFLAGS=-g -Wall -std=c99
CCLINK=gcc -o
OBJS=file0.o file1.o file2.o file3.o file4.o main.o
EXEC=prog.exe
RM=rm -f

$(EXEC): $(OBJS)
	$(CCLINK) $@ $^ $(CFLAGS)

file0.o: file0.h file1.h file2.h file4.h
	$(CC) file0.c

file1.o: file1.h file0.h file2.h file4.h
	$(CC) file1.c

file2.o: file2.h file4.h
	$(CC) file2.c

file3.o: file3.h file0.h file4.h
	$(CC) file3.c

file4.o: file4.h file0.h file3.h
	$(CC) file4.c

main.o: file0.h file1.h file2.h file3.h file4.h
	$(CC) main.c

clean:
	$(RM) file0.o
	$(RM) file1.o
	$(RM) file2.o
	$(RM) file3.o
	$(RM) file4.o
	$(RM) main.o