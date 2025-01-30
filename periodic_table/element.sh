#!/bin/bash

# Verifica se um argumento foi fornecido
if [ -z "$1" ]; then
    echo "Please provide an element as an argument."
    exit 0
fi

# Conectar ao banco de dados PostgreSQL
PSQL="psql -U freecodecamp -d periodic_table -t -c"

# Buscar informações do elemento
ELEMENT_INFO=$($PSQL "SELECT e.atomic_number, e.name, e.symbol, t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
FROM elements e
JOIN properties p ON e.atomic_number = p.atomic_number
JOIN types t ON p.type_id = t.type_id
WHERE e.atomic_number::TEXT = '$1' OR e.symbol = '$1' OR e.name = '$1'")

# Verificar se o elemento foi encontrado
if [ -z "$ELEMENT_INFO" ]; then
    echo "I could not find that element in the database."
else
    # Exibir informações formatadas
    echo "$ELEMENT_INFO" | while IFS='|' read -r atomic_number name symbol type atomic_mass melting_point boiling_point; do
        # Remover espaços em branco extras
        atomic_number=$(echo "$atomic_number" | xargs)
        name=$(echo "$name" | xargs)
        symbol=$(echo "$symbol" | xargs)
        type=$(echo "$type" | xargs)
        atomic_mass=$(echo "$atomic_mass" | xargs)
        melting_point=$(echo "$melting_point" | xargs)
        boiling_point=$(echo "$boiling_point" | xargs)

        # Exibir a saída formatada
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point celsius and a boiling point of $boiling_point celsius."
    done
fi