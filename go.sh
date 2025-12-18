rm build/*.*
../assembleur/rasm_w64.exe src/main.sna -o build/rasmoutput
../assembleur/AceDL.exe build/rasmoutput.sna