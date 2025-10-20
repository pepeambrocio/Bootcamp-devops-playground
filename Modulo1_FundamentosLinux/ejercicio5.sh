#!/bin/bash
# Ejercicio 5: Versión mejorada con URL como parámetro y validaciones

# Verificar que se han pasado exactamente dos parámetros
if [ $# -ne 2 ]; then
    echo "Se necesitan únicamente dos parámetros para ejecutar este script"
    echo "Uso: $0 <URL> <palabra>"
    exit 1
fi

URL="$1"
PALABRA="$2"
ARCHIVO_TEMP="/tmp/webpage_content.txt"

# Descargar el contenido de la página web
curl -s "$URL" -o "$ARCHIVO_TEMP"

# Verificar si la descarga fue exitosa
if [ $? -ne 0 ]; then
    echo "Error al descargar la página web desde $URL"
    exit 1
fi

# Buscar la palabra en el archivo y contar ocurrencias
OCURRENCIAS=$(grep -o "$PALABRA" "$ARCHIVO_TEMP" | wc -l)

if [ "$OCURRENCIAS" -eq 0 ]; then
    echo "No se ha encontrado la palabra \"$PALABRA\""
elif [ "$OCURRENCIAS" -eq 1 ]; then
    # Encontrar la línea donde aparece
    LINEA=$(grep -n "$PALABRA" "$ARCHIVO_TEMP" | head -n 1 | cut -d: -f1)
    
    echo "La palabra \"$PALABRA\" aparece 1 vez"
    echo "Aparece únicamente en la línea $LINEA"
else
    # Encontrar la primera línea donde aparece
    PRIMERA_LINEA=$(grep -n "$PALABRA" "$ARCHIVO_TEMP" | head -n 1 | cut -d: -f1)
    
    echo "La palabra \"$PALABRA\" aparece $OCURRENCIAS veces"
    echo "Aparece por primera vez en la línea $PRIMERA_LINEA"
fi

# Limpiar archivo temporal
rm -f "$ARCHIVO_TEMP"
