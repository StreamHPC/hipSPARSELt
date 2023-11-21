#!/bin/bash

PYTHON="python3"
PIP="pip3"

# Check depedencies

if ! type "aspell" > /dev/null; then
    echo "Please install 'aspell' !"
fi

if ! type $PYTHON > /dev/null; then
    echo "Please install 'python' !"
fi

if $PYTHON -c 'import pyspelling, pkgutil; exit(not pkgutil.find_loader("pyspelling"))'; then
    echo "Found pyspelling!"
else
    echo "Did not found pyspelling! Installing it..."
    $PIP install pyspelling
fi

# Define temporary files
SPELLCHECK_CONFIG_FILE="temp_spellcheck.yaml"
SPELLCHECK_WORDLIST="temp_wordlist.txt"

# Fetch remote config & word list
echo "Fetching $SPELLCHECK_CONFIG_FILE"
curl -o $SPELLCHECK_CONFIG_FILE https://raw.githubusercontent.com/RadeonOpenCompute/rocm-docs-core/develop/.spellcheck.yaml

echo "Fetching $SPELLCHECK_WORDLIST"
curl -o $SPELLCHECK_WORDLIST    https://raw.githubusercontent.com/RadeonOpenCompute/rocm-docs-core/develop/.wordlist.txt

# Use temporary wordlist instead of hardcoded one!
sed -i -e "s/.wordlist.txt/$SPELLCHECK_WORDLIST/g" $SPELLCHECK_CONFIG_FILE

# Append existing wordlist to temporary one
if test -f ".wordlist.txt"; then
    cat .wordlist.txt >> $SPELLCHECK_WORDLIST
fi

# Run spelling
pyspelling --verbose --config "$SPELLCHECK_CONFIG_FILE" $TASK_NAME $SOURCES_LIST
EXITCODE=$?

# Clean up
rm -f $SPELLCHECK_CONFIG_FILE
rm -f $SPELLCHECK_WORDLIST
rm -f dictionary.dic

test "$EXITCODE" -gt 1 && echo "::error title=Spelling check::Spelling check action failed, please check diagnostics";

test "$EXITCODE" -eq 1 && echo "::error title=Spelling errors::Files in repository contain spelling errors";

exit "$EXITCODE"