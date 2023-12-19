#!/bin/sh

expect_eq() {
  if [ "$2" = "$3" ]; then
    echo PASSED;
  else
    echo "FAIL ($1): Expected »$2«, but got »$3«"
  fi }

echo %%%%%% Tutorial examples
expect_eq "enema" "-.-" "$(./morsecco.py '∙ –∙ ∙ –– ∙– –––')"
expect_eq "sum formula" "15" "$(./morsecco.py '
∙ –∙–  Enter 5     n=5
∙ ∙    Enter 0       sum=0
–– –   Mark here       do {
  – –∙ copy n
  ∙–   Add               sum=sum+n
  – ∙  swap
  ∙ ∙– Enter minus1
  ∙–   Add                 dec(n)
  ––∙∙ ––∙ Zeroskip            while (n!=0)
  – ∙  swap
  ––∙  Go                    }
–∙– –∙ Konvert Num                        %i
–––    Output')"
expect_eq "sum formula command" "21" "$(./morsecco.py '
.  .. . .  -- -  - -. .-  - .  . .- .-  --.. --.  - . --.  -- . ..
. .....-. .--  . --. .....-. -.- -. ---')"
expect_eq "sum formula recurse" "-.-." "$(./morsecco.py '.  ..
- -        dup n for later adding
. .- .-    decrement n
--.. .-    Zeroskip to simply leave zero on the stack
.....-. .- otherwise call itself and Add
.. . .....-. .--  . -.. .....-. ---')"
expect_eq "sum formula recurse write" "21" "$(./morsecco.py '·   – – · ·– ·– ––·· ·– ·····–· ·–  · ·····–· ·––  · ––· ·····–·  –·– –· –––
∙ ∙∙–∙              Enter F as file handle
∙∙– ∙∙–∙ ∙∙∙∙∙–∙∙–– Use as File with given name
∙ ∙∙∙ ∙ ∙∙–∙ ∙∙– –– Write from start of file
∙ ∙∙∙∙∙–∙ ∙–∙   Read our command
∙ ∙∙–∙ ∙––      Write it to the file
∙ ∙∙–∙ ∙∙– –∙–∙ Close the file')"
expect_eq "sum formula -r" "--." "$(./morsecco.py -r .....-..-- '. .....-. .--' . -- .....-. ---)"
expect_eq "Use Vector" ".-." "$(./morsecco.py '.   ––∙∙ ––∙– – ∙– – ∙– ––∙– ∙ ∙ – ∙ –∙–∙ ∙∙ –– – ∙ ∙– ∙–– ∙ –– ∙–∙ – ∙ ∙ ∙– ∙– ––∙∙ ––∙ – ∙–∙ ∙ ∙– ∙–∙ ––∙ –– ∙ –– ∙ 
. ...- .--
∙   ∙–– ––– ∙–∙ –∙∙  ∙ –––– ∙––
∙ –––– ∙∙– ∙∙∙–
∙ –– ∙ –––– ∙–∙ –––')"
expect_eq "quine96" ".   . . . -. .-. -.-. .... . . -.-. ... . -. -.-. .. . .-- -.-. .. . -. -.-. .. ---  . -. .-- -." "$(./morsecco.py '.   . . . -. .-. -.-. .... . . -.-. ... . -. -.-. .. . .-- -.-. .. . -. -.-. .. ---  . -. .-- -.')"
expect_eq "quine90" ".   . . . -. .-. -.-. .... -.-. .--.. - - -.-. .. -.-. . --- --.- . -. .-- -.  . -. .-- -." "$(./morsecco.py '.   . . . -. .-. -.-. .... -.-. .--.. - - -.-. .. -.-. . --- --.- . -. .-- -.  . -. .-- -.')"
expect_eq "quine75" ".   . . - . -.-. .... . - -.-. ... . - -.-. .. . -..- -.-. .. ---  - - -..-" "$(./morsecco.py '.   . . - . -.-. .... . - -.-. ... . - -.-. .. . -..- -.-. .. ---  - - -..-')"
expect_eq 'Hello, world!' 'Hello, world!' "$(./morsecco.py '∙   ∙∙∙∙ –––– ∙ ∙–∙∙ ∙–∙∙ ––– ––∙∙–– –∙∙∙∙∙ ∙–– ––– ∙–∙ ∙–∙∙ –∙∙ –∙–∙––  –∙– ∙–– –∙– – –––')"
expect_eq "reverse" "123456" "$(echo '654321\c' | ./morsecco.py '. - .-. -- - -.-. .- . - .-- - - .-.. --.. --. - . --.')"
expect_eq "whitespace" " " "$(./morsecco.py '∙    ∙ ∙ ∙–– –∙–∙ ∙∙ –––')"
expect_eq "-q" " " "$(./morsecco.py -q '–∙–∙ ∙∙ –––')"

echo %%%%%% Code Golf Challenges
# https://codegolf.stackexchange.com/questions/249523/erverse-hte-ifrst-wto-eltters-fo-aech-owrd/267008#267008
expect_eq "erverse" " erverse hte ifrst wto eltters fo aech owrd" "$(echo reverse the first two letters of each word | ./morsecco.py '.    . - ..- - -- - . - .-. - - .-.. --.. --. - .- -.-. - - . -.-. - - .. -.-. . - . -.-. . -.-. .. --. - .- ---')"
expect_eq "hsorter" " erverse hte ifrst wto eltters fo aech owrd" "$(echo reverse the first two letters of each word | ./morsecco.py '.    . - ..- - -- - . - .-. - - .-.. --.. --. - .- .   -. - .  -.-.  - . -.-. . -.-. .. --. - .- ---')"
# https://codegolf.stackexchange.com/questions/60017/source-code-metamorphosis/266989#266989
source='I am a caterpillar!beautiful butterfly!.    .-. - - . - .-. -... -.. --.. --.- --.- -.-. -..-- - - --- -.-. --- - .. -.-. -.-.. - .-. -.-. . . . - . -.- .- -.-. .... .   -.- - ---  -.-. ... ---'
expect_eq "metamorphosis wrong source" "" "$(echo "$source" | ./morsecco.py x"$source")"
butterfly="$(echo "$source" | ./morsecco.py "$source")"
expect_eq "metamorphosis caterpillar" "I am a caterpillar!
.   -..-..- -..... --....- --.--.- -..... --....- -..... --...-. --..-.- --....- ---.-.- ---.-.. --.-..- --..--. ---.-.- --.--.. -..... --...-. ---.-.- ---.-.. ---.-.. --..-.- ---..-. --..--. --.--.. ----..- -....-  -.- - ---" "$butterfly"
expect_eq "metamorphosis butterfly" 'I am a beautiful butterfly!' "$(./morsecco.py "$butterfly")"
#=======
#expect_eq 'Hello, world!' 'Hello, world!' "$(./morsecco.py '∙  ∙∙∙∙ –––– ∙ ∙–∙∙ ∙–∙∙ ––– ––∙∙–– –∙∙∙∙∙ ∙–– ––– ∙–∙ ∙–∙∙ –∙∙ –∙–∙––  –∙– ∙–– –∙– – –––')"
#expect_eq " " ".  . . . -. .-. -.-. ... . . -.-. ... . -. -.-. .. . .-- -.-. .. . -. -.-. .. ---  . -. .-- -." "$(./morsecco.py '.  . . . -. .-. -.-. ... . . -.-. ... . -. -.-. .. . .-- -.-. .. . -. -.-. .. ---  . -. .-- -.')"
#expect_eq " " ".  . . . -. .-. -.-. ... -.-. .--.. - - -.-. .. -.-. . --- --.- . -. .-- -.  . -. .-- -." "$(./morsecco.py '.  . . . -. .-. -.-. ... -.-. .--.. - - -.-. .. -.-. . --- --.- . -. .-- -.  . -. .-- -.')"
#expect_eq " " ".  . . - . -.-. ... . - -.-. ... . - -.-. .. . -..- -.-. .. ---  - - -..-" "$(./morsecco.py '.  . . - . -.-. ... . - -.-. ... . - -.-. .. . -..- -.-. .. ---  - - -..-')"
#expect_eq "reverse" "
#123456" "$(echo 654321 | ./morsecco.py '∙   ∙ – ∙–∙ –– – – – ∙–∙∙ ––∙∙ ––∙ – ∙– –∙–∙ – – ∙∙ –∙–∙ ∙ – ∙ ––∙ – ∙– –––')"
#expect_eq "quine" " " "$(./morsecco.py '∙   ∙ ∙ ∙–– –∙–∙ ∙∙ –––')"
#expect_eq "-q" " " "$(./morsecco.py -q '–∙–∙ ∙∙ –––')"

# https://codegolf.stackexchange.com/questions/121921/make-a-interpreter/266983#266983
source=".   -- . -- . --.-  . . .--
. . . - .-.
-- - -.-. - -.- .- . .-...-- .- --..
 . .--... .- --.. --.
- .- --. - . . - .- . .------- .- - - --.. .-. . ------- .- - .-. - . --.
 - . -.- - . - .-- . . - . --."
program=';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;hafh;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;f;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;###ffh#h#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ffea;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;aa;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#au###h;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;h;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;o'
expect_eq "#;" '00000000: 3220 6400 0000 007b 0000 00              2 d....{...' "$(echo "$program" | ./morsecco.py "$source" | xxd)"
# https://codegolf.stackexchange.com/questions/266359/restricted-meta-cat/266979#266979
source='. . . - .-. -.- .- -.-. .... .   -.- - ---  -.-. ... ---'
meta="$(echo "foo bar" | ./morsecco.py "$source")"
expect_eq "meta-cat" "foo bar" "$(./morsecco.py "$meta")"
source='.   -- . -- .  . . .-- . . . - .-. -.- .- -.-. .... .   -.- - ---  -.-. ...
-- - -.-. - -.- .- . .-..... .- --..
 . .---. .- --.. --.
- .- . -........-..-- -- --.. --.
. -.--.--- -- --- --.
 . -..-
-.- - . - .-- --.'
meta="$(echo "foo bar" | ./morsecco.py "$source")"
expect_eq "meta-cat 2" "foo bar" "$(./morsecco.py "$meta")"
# https://codegolf.stackexchange.com/questions/181318/they-call-me-inspector-morse/266958#266958
source='. - .-. -.- .- -.- -- . . - .
-- - -.-. - - - . . -... -.. --.. --.
- .- . . - . -.-. . - .. .- - . -- --.. --.
. - .- - .. .- - . - - .-.. --.. --.
- .- --.
- .- -.-. - ---'
expect_eq "Inspector Morse S" "-" "$(echo S|./morsecco.py "$source")"
expect_eq "Inspector Morse K" "." "$(echo K|./morsecco.py "$source")"
expect_eq "Inspector Morse HELLO" "-" "$(echo HELLO|./morsecco.py "$source")"
expect_eq "Inspector Morse CODE" "." "$(echo CODE|./morsecco.py "$source")"
# https://codegolf.stackexchange.com/questions/307/obfuscated-hello-world/266841#266841
expect_eq "Obfuscated Hello World" "Hello World" "$(./morsecco.py '.   .... ---- . .-.. .-.. --- -..... ---- .-- ---- --- .-. .-.. -..  -.- .-- -.- - ---')"
# https://codegolf.stackexchange.com/questions/219576/print-0-to-100-without-1-9-characters/266840#266840
expect_eq "0–100 a" "$(seq 0 100)" "$(./morsecco.py '. . -- - - - -.- -. --- . - .- - - . .--..-.- .- --.. --. - .- --.')"
expect_eq "0–100 b" "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 " "$(./morsecco.py '.    . --..-.- -- - . .- .- - - - .. -.-. .. - . --..  --.  -.- -. ---')"
expect_eq "0–100 c" "$(seq 0 100)" "$(./morsecco.py '. .--..-.- -- - - - . --..-.- .- -.- -. --- . - .- --..  --. ')"
expect_eq "0–100 d" "$(seq 0 100)" "$(./morsecco.py '.   - - --.. -. . .- .- -. -.- -. ---  . -. .-- . --..-.. -.')"
# https://codegolf.stackexchange.com/questions/88653/print-a-10-by-10-grid-of-asterisks/267025#267025
expect_eq "10x10" "$(for x in x x x x x x x x x x; do echo '**********';done)" "$(./morsecco.py '.   . .- .- --.. .. - -. - . -. -.-. . ..  . -. .-- . -.-.-. -.- - . -.-. -. . -.-. -.- - -.-. . . -.-. -. ---')"


echo %%%%%% Test stack Transforming, memory Read/Write, Concat, vector Addition
expect_eq "basic" "-- .-- .- -.." "$(./morsecco.py '. --. . .-.- . -.. . .-- . -. . .- . . - .. - .. -.-. .. . ..... .-- - -- -.-. .. - ... - . -.-. .. - .-- -.-. .. - . . ..... .-. -.-. .. .- ---')"

echo %%%%%% Test scriptfile, own command, Mark, Go, Konvert to Number
expect_eq "++"  "42" "$(./morsecco.py -r multiply.-- '. .. .-- . --. . --- .. -.- -. ---')"
expect_eq "-+" "-42" "$(./morsecco.py -r multiply.-- '. .. .-- . .--. . --- .. -.- -. ---')"
expect_eq "+-" "-42" "$(./morsecco.py -r multiply.-- '. .. .-- . --. . .--- .. -.- -. ---')"
expect_eq "--"  "42" "$(./morsecco.py -r multiply.-- '. .. .-- . .--. . .--- .. -.- -. ---')"

echo %%%%%% eXecute recursiv
expect_eq "X" "1
2
3" "$(./morsecco.py '. -- .   --.. --- - - . .- .- . -..- -..- -.- -. ---  -..-')"
expect_eq ".- -..-" "1
2
3" "$(./morsecco.py '. -- .   --.. --- - - . .- .- . .- -..- -.- -. ---  -..-')"

echo %%%%%% Test File Write and Read
#echo "./morsecco.py '.  ..- --.--- . -. . .--  . ..-. ..- ..-.  . --- . ..-. .--  . ... . ..-. .--  . ..-. ..- ..-  . -.. . ..-. ...-. .-. ---  . - . ..-. .--'" "---."
expect_eq "write" "---." $(./morsecco.py '.   .-..- ..- . -. . .--  . ..-. ..- ..-.  . --- . ..-. .--  . ... . ..-. .--  . ..-. ..- ----  . -.. . ..-.  .-. ---  . - . ..-. .--')
expect_eq "verify" "---.-" "$(cat '.-../../ -  .--')"

echo %%%%%% Test Mark Move
expect_eq "move" "--.-. " "$(./morsecco.py '-- -.- . --- --  . .- .-. ---')"

echo %%%%%% Test Find command
expect_eq "empty"      ".-" "$(./morsecco.py -r .-../..-...-.-...-- '. ..-. .-- . --..-- .    ..-. ---')"
expect_eq "not inside" ".-" "$(./morsecco.py -r .-../..-...-.-...-- '. ..-. .-- . --..- . .-. ..-. ---')"
expect_eq "too long"   ".-" "$(./morsecco.py -r .-../..-...-.-...-- '. ..-. .-- . --    . --- ..-. ---')"
expect_eq "start pos"  "."  "$(./morsecco.py -r .-../..-...-.-...-- '. ..-. .-- . --.. . --.. ..-. ---')"
expect_eq "pos 1"      "-"  "$(./morsecco.py -r .-../..-...-.-...-- '. ..-. .-- . --..-- . -. ..-. ---')"
expect_eq "pos 2"      "-." "$(./morsecco.py -r .-../..-...-.-...-- '. ..-. .-- . --..-- . .. ..-. ---')"
expect_eq "end pos"    "-." "$(./morsecco.py -r .-../..-...-.-...-- '. ..-. .-- . --..- . ..- ..-. ---')"

echo %%%%%% Local storage
expect_eq "local" "-.-
-.-
-.-
..." "$(./morsecco.py '.   . -.- . --- .-- . --- .-. ---  . -. .--  -. . --- .-. ---  . ... . --- .--  . -. ..- .-.. -. . --- .-. ---')"

echo %%%%%% Use eXecute
expect_eq "override buildin" ".-..-." "$(./morsecco.py '.   - - . - .-- . - .--  . --- .-- . --- ..- -..- . .-. ---')"

echo %%%%%% Use Url
expect_eq "fetch website" "# morsecco" "$(echo 'https://raw.githubusercontent.com/Philipp-Sasse/morsecco/main/README.md' | ./morsecco.py '. - .-. . -. .-- . -. ..- ..- . -. .-. -.-. -.-. ---')"

echo %%%%%% Floats
expect_eq "float Konversion" "-............... ---------------- ..-.-..- -...............- ..-......-. ..-....-. ..-..---...-..---" "$(echo 32768 65535 65536 65537 0.5 0.125 2.56E6 |./morsecco.py '. - .-. -.- .-. ---')"
expect_eq "float Add" "--" "$(dc -e '20 k 10 7 / p 11 7 / p'|./morsecco.py '. - ..- - . - .-. -.- .-. . - .-. -.- .-. .- ---')"

echo %%%%%% Random
expect_eq "random float" "..-...-..--..-.--.--...-----..-...--.--.---.-.--....-...---.." "$(./morsecco.py '. .-. ..- ... . - . .-. .-- . . . .-. .-. ---')"
expect_eq "random int" "--." "$(./morsecco.py '. .-. ..- ... . . . .-. .-- . --- . .-. .-. ---')"
expect_eq "random range" "---" "$(./morsecco.py '. .-. ..- ... . -.- . .-. .-- .   -.- ---  . .-. .-. ---')"

echo %%%%%% Base
expect_eq "to hex float" "2A.2" "$(echo 42.125 16|./morsecco.py '. - ..- - . - .-. -.- .-. . - .-. -.- .-. . -... - - ..- ... .-- -.- -. ---')"
expect_eq "from hex float" "985605.0625" "$(echo 16 F0A05.1|./morsecco.py '. - ..- - . - .-. -.- .-. . -... - - ..- ... .-- . - .-. -.- .-. . -.-. . -... .-- -.- -. ---')"
expect_eq "to float base" "233.1" "$(echo 57.222222222223 4.5|./morsecco.py '. - ..- - . - .-. -.- .-. . - .-. -.- .-. . -... - - ..- ... .-- -.- -. ---')"
expect_eq "from float base" "---..-" "$(echo 4.5 233|./morsecco.py '. - ..- - . - .-. -.- .-. . -... - - ..- ... .-- . - .-. -.- .-. ---')"

echo %%%%%% Date/time
expect_eq "timestamp" "OK" "$(if [[ $(./morsecco.py '. -.. ..- ... . -.. .-. -.- -. ---') > $(date +"%s") && $(./morsecco.py '. -.. ..- ... . -.. .-. . .-. .- -.- -. ---') < $(date +"%s") ]]; then echo OK; fi)"
expect_eq "format time" "2030 1 17 1 1 52" "$(./morsecco.py '. ---....----....----....----.... -.- -.. -.- -. ---')"
expect_eq "set format year" "$(date +%Y)" "$(./morsecco.py '. -.. ..- ... . -.. .-. . -.-- . -.. .--  -.- -.. -.- -. ---')"

