#!/bin/bash

# Convert SPEC.md to SPEC.html using pandoc

if ! command -v pandoc &> /dev/null; then
    echo "Error: pandoc non è installato"
    echo "Installa con: brew install pandoc"
    exit 1
fi

if [ ! -f "SPEC.md" ]; then
    echo "Error: SPEC.md non trovato"
    exit 1
fi

echo "Converting SPEC.md → SPEC.html..."

pandoc SPEC.md \
    -f markdown \
    -t html5 \
    -s \
    --metadata title="Progetto MediaContacts" \
    --toc \
    --css="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css" \
    -o SPEC.html

if [ $? -eq 0 ]; then
    echo "✓ SPEC.html generato con successo"
else
    echo "✗ Errore durante la conversione"
    exit 1
fi
