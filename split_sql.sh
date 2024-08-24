#!/bin/bash

# Nombre del archivo SQL grande
input_file="NOMBREDEL.sql"

# Tamaño máximo de cada parte en bytes (25 MB)
max_size=$((10 * 1024 * 1024))

# Variables para el conteo y manejo de archivos
part_num=1
current_size=0
output_file="part_${part_num}.sql"

# Crear el primer archivo de salida
echo "" > $output_file

# Leer el archivo SQL línea por línea
while IFS= read -r line
do
    # Añadir la línea al archivo actual
    echo "$line" >> $output_file

    # Calcular el tamaño de la línea
    line_size=$(echo -n "$line" | wc -c)
    current_size=$((current_size + line_size))

    # Si el tamaño actual excede el máximo permitido, crear un nuevo archivo
    if [[ $current_size -ge $max_size ]]; then
        # Resetear el tamaño actual y crear un nuevo archivo
        current_size=0
        part_num=$((part_num + 1))
        output_file="part_${part_num}.sql"
        echo "" > $output_file
    fi
done < "$input_file"

echo "División completada. Se han creado $(($part_num)) archivos."