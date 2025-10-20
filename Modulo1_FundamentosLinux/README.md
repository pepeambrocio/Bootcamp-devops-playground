# Ejercicios de Bash - Soluciones

Este repositorio contiene las soluciones a los ejercicios de línea de comandos en Linux.

## Contenido

- `ejercicio1.sh` - Crear jerarquía de directorios y archivos
- `ejercicio2.sh` - Copiar contenido y mover archivos
- `ejercicio3.sh` - Script completo con parámetro personalizable
- `ejercicio4.sh` - Descargar página web y buscar palabra
- `ejercicio5.sh` - Versión mejorada del ejercicio 4

## Instrucciones de Uso

### Ejercicio 1: Crear jerarquía

```bash
chmod +x ejercicio1.sh
./ejercicio1.sh
```

Crea la siguiente estructura:
```
foo/
├─ dummy/
│  ├─ file1.txt (con contenido "Me encanta la bash!!")
│  ├─ file2.txt (vacío)
├─ empty/
```

### Ejercicio 2: Copiar y mover

```bash
chmod +x ejercicio2.sh
./ejercicio2.sh
```

⚠️ **Nota**: Este script requiere que primero hayas ejecutado el ejercicio1.sh

Resultado:
```
foo/
├─ dummy/
│  ├─ file1.txt
├─ empty/
   ├─ file2.txt
```

Ambos archivos contendrán "Me encanta la bash!!"

### Ejercicio 3: Script completo con parámetro

```bash
chmod +x ejercicio3.sh

# Sin parámetro (usa texto por defecto)
./ejercicio3.sh

# Con parámetro personalizado
./ejercicio3.sh "Mi texto personalizado"
```

Si no se pasa parámetro, usa el texto por defecto: "Que me gusta la bash!!!!"

### Ejercicio 4: Buscar palabra en página web

```bash
chmod +x ejercicio4.sh

# Buscar una palabra
./ejercicio4.sh patata
./ejercicio4.sh lemon
```

Ejemplos de salida:
```bash
$ ./ejercicio4.sh patata
> No se ha encontrado la palabra "patata"

$ ./ejercicio4.sh lemon
> La palabra "lemon" aparece 3 veces
> Aparece por primera vez en la línea 27
```

### Ejercicio 5: Versión mejorada (OPCIONAL)

```bash
chmod +x ejercicio5.sh

# Uso correcto
./ejercicio5.sh https://lemoncode.net/ lemon

# Error - número incorrecto de parámetros
./ejercicio5.sh https://lemoncode.net/
> Se necesitan únicamente dos parámetros para ejecutar este script
```

Ejemplos de salida:
```bash
$ ./ejercicio5.sh https://lemoncode.net/ patata
> No se ha encontrado la palabra "patata"

$ ./ejercicio5.sh https://lemoncode.net/ lemon
> La palabra "lemon" aparece 3 veces
> Aparece por primera vez en la línea 27

$ ./ejercicio5.sh https://example.com/ example
> La palabra "example" aparece 1 vez
> Aparece únicamente en la línea 15
```

## Requisitos

- Sistema operativo Linux o macOS
- Bash shell
- `curl` (para ejercicios 4 y 5)
- `tree` (opcional, para mejor visualización)

## Notas

- Los scripts están diseñados para ser ejecutados en el directorio donde se encuentran
- El ejercicio 3 elimina la carpeta `foo` si existe antes de crear la nueva estructura
- Los ejercicios 4 y 5 descargan contenido web, asegúrate de tener conexión a internet
