Red []

a-an: func [
    "Returns the appropriate variant of a or an"
    str [string!] 
    /pre "Prepend to str" 
    /local 
        lst "List of words that start with a vowel which sounds like a consonant"
        tmp
][
    lst: do load %cs.txt    ;-- consonant sounds
    tmp: case [
        find lst load str ["a"]
        find "aeiou" str/1 ["an"]
        'else ["a"]
    ]
    either pre [rejoin [tmp #" " str]] [tmp]
]