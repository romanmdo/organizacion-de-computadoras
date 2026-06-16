all: programa

# Unimos los dos archivos compilados
programa: main.o sumar.o
	gcc -m32 main.o sumar.o -o programa

# Compilamos C a 32 bits
main.o: main.c
	gcc -m32 -c main.c -o main.o

# Compilamos tu Assembler a 32 bits
sumar.o: sumar_matriz.asm
	nasm -f elf32 sumar_matriz.asm -o sumar.o

# Regla para limpiar la carpeta
clean:
	rm -f *.o programa