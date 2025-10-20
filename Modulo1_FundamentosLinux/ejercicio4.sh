#!/bin/bash
# Ejercicio 4: Descargar contenido de una página web y buscar una palabra

# URL constante
URL="https://lemoncode.net/"

# Verificar que se ha pasado un parámetro
if [ -z "$1" ]; then
    echo "Error: Debes proporcionar una palabra para buscar"
    echo "Uso: $0 <palabra>"
    exit 1
fi

PALABRA="$1"
ARCHIVO_TEMP="/tmp/webpage_content.txt"

# Descargar el contenido de la página web
curl -s "$URL" -o "$ARCHIVO_TEMP"

# Verificar si la descarga fue exitosa
if [ $? -ne 0 ]; then
    echo "Error al descargar la página web"
    exit 1
fi

# Buscar la palabra en el archivo y contar ocurrencias
OCURRENCIAS=$(grep -o "$PALABRA" "$ARCHIVO_TEMP" | wc -l)

if [ "$OCURRENCIAS" -eq 0 ]; then
    echo "No se ha encontrado la palabra \"$PALABRA\""
else
    # Encontrar la primera línea donde aparece
    PRIMERA_LINEA=$(grep -n "$PALABRA" "$ARCHIVO_TEMP" | head -n 1 | cut -d: -f1)
    
    echo "La palabra \"$PALABRA\" aparece $OCURRENCIAS veces"
    echo "Aparece por primera vez en la línea $PRIMERA_LINEA"
fi

# Limpiar archivo temporal
rm -f "$ARCHIVO_TEMP"
