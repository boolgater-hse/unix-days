#!/bin/bash

mkdir -p temp
cd temp

touch level2.c
{
    echo "#include <stdio.h>"
    echo "#include <stdlib.h>"
    echo ""
    echo "int main()"
    echo "{"
    echo "    FILE* out = fopen(\"./level2.sh\", \"w\");"
    echo ""
    echo "    fprintf(out, \"#!/bin/bash\n\""
    echo "                 \"\n\""
    echo "                 \"mkdir -p temp\n\""
    echo "                 \"cd temp\n\""
    echo "                 \"touch level1.c\n\""
    echo "                 \"{\n\""
    echo "                 \"    echo \\\"#include <stdio.h>\\\"\n\""
    echo "                 \"    echo \\\"\\\"\n\""
    echo "                 \"    echo \\\"int main()\\\"\n\""
    echo "                 \"    echo \\\"{\\\"\n\""
    echo "                 \"    echo \\\"    printf(\\\\\\\"Hello, World!\\\\n\\\\\\\");\\\"\n\""
    echo "                 \"    echo \\\"    return 0;\\\"\n\""
    echo "                 \"    echo \\\"}\\\"\n\""
    echo "                 \"} > level1.c\n\""
    echo "                 \"\n\""
    echo "                 \"gcc -o level1 level1.c\n\""
    echo "                 \"./level1\n\");"
    echo ""
    echo "    fclose(out);"
    echo ""
    echo "    system(\"chmod +x ./level2.sh\");"
    echo "    system(\"./level2.sh\");"
    echo "    return 0;"
    echo "}"
} > level2.c

gcc -o level2 level2.c
./level2
