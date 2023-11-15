#!/bin/sh

expect_eq() {
  if [ "$1" = "$2" ]; then
    echo PASSED;
  else
    echo FAIL: Expected »"$1"«, but got »"$2"«;
  fi }

echo Tutorial examples
expect_eq "-.-" "$(./morsecco '∙ –∙ ∙ –– ∙– –––')"
expect_eq "15" "$(./morsecco '
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
expect_eq "21" "$(./morsecco '
.  . .,, -- -, - -. .-, - ., . .- .-, --.. --., - ., --.,, -- .  
. .....-. .--  . --. .....-. -.- -. ---
∙ ∙∙–∙              Enter F as file handle
∙∙– ∙∙–∙ ∙∙∙∙∙–∙∙–– Use as File with given name
∙ ∙∙∙ ∙ ∙∙–∙ ∙∙– –– Write from start of file
∙ ∙∙∙∙∙–∙ ∙–∙   Read our command
∙ ∙∙–∙ ∙––      Write it to the file
∙ ∙∙–∙ ∙∙– –∙–∙ Close the file')"
expect_eq "--." "$(./morsecco -r .....-..-- '. .....-. .--' . -- .....-. ---)"
expect_eq ".-." "$(./morsecco '.  ––.∙ ––∙– – ∙– – ∙– ––∙– ∙ ∙ – ∙ –∙–∙ ∙∙ –– – ∙ ∙– ∙–– ∙ –– ∙–∙ – ∙ ∙ ∙– ∙– ––∙∙ ––∙ – ∙–∙ ∙ ∙– ∙–∙ ––∙ –– ∙ –– ∙ 
. ...- .--
∙  ∙–– ––– ∙–∙ –∙∙  ∙ –––– ∙––
∙ –––– ∙∙– ∙∙∙–
∙ –– ∙ –––– ∙–∙ –––')"
expect_eq "Hello, world!" "$(./morsecco '∙  ∙∙∙∙ –––– ∙ ∙–∙∙ ∙–∙∙ ––– ––∙∙–– –∙∙∙∙∙ ∙–– ––– ∙–∙ ∙–∙∙ –∙∙ –∙–∙––  –∙– ∙–– –∙– – –––')"
expect_eq "
123456" "$(echo 654321 | ./morsecco '∙   ∙ – ∙–∙ –– – – – ∙–∙∙ ––∙∙ ––∙ – ∙– –∙–∙ – – ∙∙ –∙–∙ ∙ – ∙ ––∙ – ∙– –––')"
expect_eq " " "$(./morsecco '∙   ∙ ∙ ∙–– –∙–∙ ∙∙ –––')"
expect_eq " " "$(./morsecco -q '–∙–∙ ∙∙ –––')"

echo Test stack Transforming, memory Read/Write, Concat, vector Addition
expect_eq "-- .-- .- -.." "$(./morsecco '. --. . .-.- . -.. . .-- . -. . .- . . - .. - .. -.-. .. . ..... .-- - -- -.-. .. - ... - . -.-. .. - .-- -.-. .. - . . ..... .-. -.-. .. .- ---')"

echo Test scriptfile, own command, Mark, Go, Konvert to Number
expect_eq  "42" "$(./morsecco -r multiply.-- '. .. .-- . --. . --- .. -.- -. ---')"
expect_eq "-42" "$(./morsecco -r multiply.-- '. .. .-- . .--. . --- .. -.- -. ---')"
expect_eq "-42" "$(./morsecco -r multiply.-- '. .. .-- . --. . .--- .. -.- -. ---')"
expect_eq  "42" "$(./morsecco -r multiply.-- '. .. .-- . .--. . .--- .. -.- -. ---')"

echo Test File Write and Read
#echo "./morsecco '.  ..- --.--- . -. . .--  . ..-. ..- ..-.  . --- . ..-. .--  . ... . ..-. .--  . ..-. ..- ..-  . -.. . ..-. ...-. .-. ---  . - . ..-. .--'" "---."
expect_eq "---." $(./morsecco '.  ..- --.--- . -. . .--  . ..-. ..- ..-.  . --- . ..-. .--  . ... . ..-. .--  . ..-. ..- ..-  . -.. . ..-.  .-. ---  . - . ..-. .--')
expect_eq "---.-" "$(cat '../--.--/ -  .--')"

echo Test Mark Move
expect_eq "--.-. " "$(./morsecco '-- -.- . --- --  . .- .-. ---')"
