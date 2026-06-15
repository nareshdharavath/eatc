#!/usr/bin/env bash
# Compile the EATC project and build an executable jar (no build tool required).
set -e
mkdir -p build/classes build/jar
find src/main/java -name "*.java" > sources.txt
javac -d build/classes @sources.txt
printf 'Manifest-Version: 1.0\nMain-Class: com.eatc.App\n' > build/jar/MANIFEST.MF
jar cfm dist/eatc.jar build/jar/MANIFEST.MF -C build/classes .
echo "Built dist/eatc.jar"
echo "Run:  java -jar dist/eatc.jar        (interactive menu)"
echo "      java -jar dist/eatc.jar demo   (scripted demonstration)"
