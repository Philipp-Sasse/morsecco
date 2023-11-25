#!/bin/sh

expect_eq() {
  if [ "$2" = "$3" ]; then
    echo PASSED;
  else
    echo "FAIL ($1): Expected »$2«, but got »$3«"
  fi }

echo %%%%%% Tutorial examples
expect_eq "enema" "-.-" "$(./morsecco '∙ –∙ ∙ –– ∙– –––')"
expect_eq "sum formula" "15" "$(./morsecco '
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
expect_eq "sum formula command" "21" "$(./morsecco '
.  . .,, -- -, - -. .-, - ., . .- .-, --.. --., - ., --.,, -- .  
. .....-. .--  . --. .....-. -.- -. ---
∙ ∙∙–∙              Enter F as file handle
∙∙– ∙∙–∙ ∙∙∙∙∙–∙∙–– Use as File with given name
∙ ∙∙∙ ∙ ∙∙–∙ ∙∙– –– Write from start of file
∙ ∙∙∙∙∙–∙ ∙–∙   Read our command
∙ ∙∙–∙ ∙––      Write it to the file
∙ ∙∙–∙ ∙∙– –∙–∙ Close the file')"
expect_eq "sum formula -r" "--." "$(./morsecco -r .....-..-- '. .....-. .--' . -- .....-. ---)"
expect_eq " " ".-." "$(./morsecco '.  ––.∙ ––∙– – ∙– – ∙– ––∙– ∙ ∙ – ∙ –∙–∙ ∙∙ –– – ∙ ∙– ∙–– ∙ –– ∙–∙ – ∙ ∙ ∙– ∙– ––∙∙ ––∙ – ∙–∙ ∙ ∙– ∙–∙ ––∙ –– ∙ –– ∙ 
. ...- .--
∙  ∙–– ––– ∙–∙ –∙∙  ∙ –––– ∙––
∙ –––– ∙∙– ∙∙∙–
∙ –– ∙ –––– ∙–∙ –––')"
expect_eq 'Hello, world!' 'Hello, world!' "$(./morsecco '∙  ∙∙∙∙ –––– ∙ ∙–∙∙ ∙–∙∙ ––– ––∙∙–– –∙∙∙∙∙ ∙–– ––– ∙–∙ ∙–∙∙ –∙∙ –∙–∙––  –∙– ∙–– –∙– – –––')"
expect_eq " " ".  . . . -. .-. -.-. ... . . -.-. ... . -. -.-. .. . .-- -.-. .. . -. -.-. .. ---  . -. .-- -." "$(./morsecco '.  . . . -. .-. -.-. ... . . -.-. ... . -. -.-. .. . .-- -.-. .. . -. -.-. .. ---  . -. .-- -.')"
expect_eq " " ".  . . . -. .-. -.-. ... -.-. .--.. - - -.-. .. -.-. . --- --.- . -. .-- -.  . -. .-- -." "$(./morsecco '.  . . . -. .-. -.-. ... -.-. .--.. - - -.-. .. -.-. . --- --.- . -. .-- -.  . -. .-- -.')"
expect_eq " " ".  . . - . -.-. ... . - -.-. ... . - -.-. .. . -..- -.-. .. ---  - - -..-" "$(./morsecco '.  . . - . -.-. ... . - -.-. ... . - -.-. .. . -..- -.-. .. ---  - - -..-')"
expect_eq "reverse" "
123456" "$(echo 654321 | ./morsecco '∙   ∙ – ∙–∙ –– – – – ∙–∙∙ ––∙∙ ––∙ – ∙– –∙–∙ – – ∙∙ –∙–∙ ∙ – ∙ ––∙ – ∙– –––')"
expect_eq "quine" " " "$(./morsecco '∙   ∙ ∙ ∙–– –∙–∙ ∙∙ –––')"
expect_eq "-q" " " "$(./morsecco -q '–∙–∙ ∙∙ –––')"

echo %%%%%% Code Golf Challenges
# https://codegolf.stackexchange.com/questions/249523/erverse-hte-ifrst-wto-eltters-fo-aech-owrd/267008#267008
expect_eq "erverse" " erverse hte ifrst wto eltters fo aech owrd" "$(echo reverse the first two letters of each word | ./morsecco '.   . - ..- - -- - . - .-. - - .-.. --.. --. - .- -.-. - - . -.-. - - .. -.-. . - . -.-. . -.-. .. --. - .- ---')"
expect_eq "hsorter" " erverse hte ifrst wto eltters fo aech owrd" "$(echo reverse the first two letters of each word | ./morsecco '.   . - ..- - -- - . - .-. - - .-.. --.. --. - .- .  -. - .  -.-.  - . -.-. . -.-. .. --. - .- ---')"
# https://codegolf.stackexchange.com/questions/60017/source-code-metamorphosis/266989#266989
source='I am a caterpillar!beautiful butterfly!.   .-. - - . - .-. -... -.. --.. --.- --.- -.-. -..-- - - --- -.-. --- - .. -.-. -.-.. - .-. -.-. . . . - . -.- .- -.-. ... .  -.- - ---  -.-. ... ---'
expect_eq "metamorphosis wrong source" "" "$(echo "$source" | ./morsecco x"$source")"
butterfly="$(echo "$source" | ./morsecco "$source")"
expect_eq "metamorphosis caterpillar" "I am a caterpillar!
.  -..-..- -..... --....- --.--.- -..... --....- -..... --...-. --..-.- --....- ---.-.- ---.-.. --.-..- --..--. ---.-.- --.--.. -..... --...-. ---.-.- ---.-.. ---.-.. --..-.- ---..-. --..--. --.--.. ----..- -....-  -.- - ---" "$butterfly"
expect_eq "metamorphosis butterfly" 'I am a beautiful butterfly!' "$(./morsecco "$butterfly")"
# https://codegolf.stackexchange.com/questions/121921/make-a-interpreter/266983#266983
source=".  -- . -- . --.-  . . .--
. . . - .-.
-- - -.-. - -.- .- . .-...-- .- --.. ..
. .--... .- --.. --.
- .- --. - . . - .- . .------- .- - - --.. .-. . ------- .- - .-. - . --.
.. - . -.- - . - .-- . . - . --."
program=';;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;hafh;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;f;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;###ffh#h#;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ffea;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;aa;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;#au###h;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;h;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;o'
expect_eq "#;" "0000000    2  sp   d nul nul nul nul   { nul nul nul                    
0000013" "$(echo "$program" | ./morsecco "$source" | od -a)"
# https://codegolf.stackexchange.com/questions/266359/restricted-meta-cat/266979#266979
source='. . . - .-. -.- .- -.-. ... .  -.- - ---  -.-. ... ---'
meta="$(echo "foo bar" | ./morsecco "$source")"
expect_eq "meta-cat" "foo bar" "$(./morsecco "$meta")"
source='.  -- . -- .  . . .-- . . . - .-. -.- .- -.-. ... .  -.- - ---  -.-. ... 
-- - -.-. - -.- .- . .-..... .- --.. ..
. .---. .- --.. --.
- .- . -........-..-- -- --.. --.
. -.--.--- -- --- --. ..
. -..-
-.- - . - .-- --.'
meta="$(echo "foo bar" | ./morsecco "$source")"
expect_eq "meta-cat 2" "foo bar" "$(./morsecco "$meta")"
# https://codegolf.stackexchange.com/questions/181318/they-call-me-inspector-morse/266958#266958
source='. - .-. -.- .- -.- -- . . - .
-- - -.-. - - - . . -... -.. --.. --.
- .- . . - . -.-. . - .. .- - . -- --.. --.
. - .- - .. .- - . - - .-.. --.. --.
- .- --.
- .- -.-. - ---'
expect_eq "Inspector Morse S" "-" "$(echo S|./morsecco "$source")"
expect_eq "Inspector Morse K" "." "$(echo K|./morsecco "$source")"
expect_eq "Inspector Morse HELLO" "-" "$(echo HELLO|./morsecco "$source")"
expect_eq "Inspector Morse CODE" "." "$(echo CODE|./morsecco "$source")"
# https://codegolf.stackexchange.com/questions/307/obfuscated-hello-world/266841#266841
expect_eq "Obfuscated Hello World" "Hello World" "$(./morsecco '.  .... ---- . .-.. .-.. --- -..... ---- .-- ---- --- .-. .-.. -..  -.- .-- -.- - ---')"
# https://codegolf.stackexchange.com/questions/219576/print-0-to-100-without-1-9-characters/266840#266840
expect_eq "0–100 a" "$(seq 0 100)" "$(./morsecco '. . -- - - - -.- -. --- . - .- - - . .--..-.- .- --.. --. - .- --.')"
expect_eq "0–100 b" "0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100" "$(./morsecco '.   . --..-.- -- - . .- .- - - - .. -.-. .. - . --..  --.  -.- -. ---')"
expect_eq "0–100 c" "$(seq 0 100)" "$(./morsecco '. .--..-.- -- - - - . --..-.- .- -.- -. --- . - .- --..  --. ')"
expect_eq "0–100 d" "$(seq 0 100)" "$(./morsecco '.  - - --.. -. . .- .- -. -.- -. ---  . -. .-- . --..-.. -.')"
# https://codegolf.stackexchange.com/questions/88653/print-a-10-by-10-grid-of-asterisks/267025#267025
expect_eq "10x10 *" "$(python3 -c 'print(("*"*10+"\n")*10)')" "$(./morsecco '.  . .- .- --.. .. - -. - . -. -.-. . ..  . -. .-- . -.-.-. -.- - . -.-. -. . -.-. -.- - -.-. . . -.-. -. ---')"


echo %%%%%% Test stack Transforming, memory Read/Write, Concat, vector Addition
expect_eq "basic" "-- .-- .- -.." "$(./morsecco '. --. . .-.- . -.. . .-- . -. . .- . . - .. - .. -.-. .. . ..... .-- - -- -.-. .. - ... - . -.-. .. - .-- -.-. .. - . . ..... .-. -.-. .. .- ---')"

echo %%%%%% Test scriptfile, own command, Mark, Go, Konvert to Number
expect_eq "++"  "42" "$(./morsecco -r multiply.-- '. .. .-- . --. . --- .. -.- -. ---')"
expect_eq "-+" "-42" "$(./morsecco -r multiply.-- '. .. .-- . .--. . --- .. -.- -. ---')"
expect_eq "+-" "-42" "$(./morsecco -r multiply.-- '. .. .-- . --. . .--- .. -.- -. ---')"
expect_eq "--"  "42" "$(./morsecco -r multiply.-- '. .. .-- . .--. . .--- .. -.- -. ---')"

echo %%%%%% eXecute recursiv
expect_eq "X" "1
2
3" "$(./morsecco '. -- .  --.. --- - - . .- .- . -..- -..- -.- -. ---  -..-')"
expect_eq ".- -..-" "1
2
3" "$(./morsecco '. -- .  --.. --- - - . .- .- . .- -..- -.- -. ---  -..-')"

echo %%%%%% Test File Write and Read
#echo "./morsecco '.  ..- --.--- . -. . .--  . ..-. ..- ..-.  . --- . ..-. .--  . ... . ..-. .--  . ..-. ..- ..-  . -.. . ..-. ...-. .-. ---  . - . ..-. .--'" "---."
expect_eq "write" "---." $(./morsecco '.  .-..- ..- . -. . .--  . ..-. ..- ..-.  . --- . ..-. .--  . ... . ..-. .--  . ..-. ..- ..-  . -.. . ..-.  .-. ---  . - . ..-. .--')
expect_eq "verify" "---.-" "$(cat '.-../../ -  .--')"

echo %%%%%% Test Mark Move
expect_eq "move" "--.-. " "$(./morsecco '-- -.- . --- --  . .- .-. ---')"

echo %%%%%% Test Find command
expect_eq "empty"      ".-" "$(./morsecco -r .-../..-...-.-...-- '. ..-. .-- . --..-- .    ..-. ---')"
expect_eq "not inside" ".-" "$(./morsecco -r .-../..-...-.-...-- '. ..-. .-- . --..- . .-. ..-. ---')"
expect_eq "too long"   ".-" "$(./morsecco -r .-../..-...-.-...-- '. ..-. .-- . --    . --- ..-. ---')"
expect_eq "start pos"  "."  "$(./morsecco -r .-../..-...-.-...-- '. ..-. .-- . --.. . --.. ..-. ---')"
expect_eq "pos 1"      "-"  "$(./morsecco -r .-../..-...-.-...-- '. ..-. .-- . --..-- . -. ..-. ---')"
expect_eq "pos 2"      "-." "$(./morsecco -r .-../..-...-.-...-- '. ..-. .-- . --..-- . .. ..-. ---')"
expect_eq "end pos"    "-." "$(./morsecco -r .-../..-...-.-...-- '. ..-. .-- . --..- . ..- ..-. ---')"
