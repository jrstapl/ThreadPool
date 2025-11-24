CC=gcc
CFLAGS=-I./inc
DEPS = threadpool.h
TARGET = bin/pool_test
SRC = $(wildcard src/*.c)
OBJ = $(SRC:src/%.c=obj/%.o)

%.o: src/%.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

run: clean default
	./$(TARGET)


default: $(TARGET)

clean:
	rm -rf obj/*.o
	rm -rf bin/*

$(TARGET): $(OBJ)
	$(CC) -o $@ $?

$(OBJ): obj/%.o: src/%.c 
	$(CC) -c $< -o $@ $(CFLAGS)
