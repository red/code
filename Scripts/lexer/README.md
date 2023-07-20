# Red's lexer event system and callbacks

Those scripts show how to use the lexer events and callback function to modify its behavior and achieve some transformations or analysis on Red files without having to fully `load` the files first.


`%count-type.red`: Analyzing one or more Red/Rebol source code in text formats by counting the number of values present per-datatype.

`%flatten.red`: Customized Red values loader that will flatten all nested container structures (except for paths) and return a one-dimensional list of all the loaded values.

`%get-comments`: Extracts all the line comments from a Red file.

`%load-commas`: Toy extension for Red syntax allowing commas to be used as separator between values.

`%longest.red`: Reports some stats about longest/biggest values in a Red source file.

`%unique-words.red`: Counts unique words occurences in a given Red source file.


