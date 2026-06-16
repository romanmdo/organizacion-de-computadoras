# Nombre del archivo ejecutable final
EJECUTABLE = programa_final

# Regla principal: qué hacer cuando escribís "make" en la consola
all: $(EJECUTABLE)

# 1er Paso: Cómo compilar el archivo Assembler (Crea subrutina.o)
subrutina.o: subrutina.asm
	nasm -f elf32 subrutina.asm -o subrutina.o

# 2do Paso: Cómo compilar el archivo C (Crea main.o)
# Usamos -m32 para forzar a GCC a trabajar en 32 bits como nuestro Assembler
main.o: main.c
	gcc -m32 -c main.c -o main.o

# 3er Paso: El Enlazador (Junta subrutina.o y main.o en el ejecutable final)
$(EJECUTABLE): subrutina.o main.o
	gcc -m32 subrutina.o main.o -o $(EJECUTABLE)

# Regla para limpiar los archivos basura (Ejecutando "make clean")
clean:
	rm -f *.o $(EJECUTABLE)