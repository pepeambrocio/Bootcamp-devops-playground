#!/bin/bash
# Ejercicio 2: Volcar contenido de file1.txt a file2.txt y mover file2.txt

# Copiar el contenido de file1.txt a file2.txt
cat foo/dummy/file1.txt > foo/dummy/file2.txt

# Mover file2.txt a la carpeta empty
mv foo/dummy/file2.txt foo/empty/

echo "Operación completada. Estructura resultante:"
tree foo/ 2>/dev/null || find foo/ -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'

echo -e "\nContenido de foo/dummy/file1.txt:"
cat foo/dummy/file1.txt

echo -e "\nContenido de foo/empty/file2.txt:"
cat foo/empty/file2.txt
