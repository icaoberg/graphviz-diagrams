#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <input_file.dot>"
    exit 1
fi

input_file="$1"
output_file="${input_file%.dot}.png"

dot -Tpng -Gdpi=600 "$input_file" -o "$output_file" && eog "$output_file"
