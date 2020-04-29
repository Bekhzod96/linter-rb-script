# Linter

**In this project, I implement Linter to check source file of the CSS**

>I have implemented Linter which checks errors in CSS course file
>Most of the time it will notify if indentation errors and some repetitions of the rules. All errors list given above 

After checking file it will return all errors into the console if errors doesn't exits then it simple returns 
**1 files inspected, no offenses detected**

>To test costum file please follow to the instaction in Getting start section

**Concept of the Linter**

lint, or a linter, is a tool that analyzes source code to flag programming errors, bugs, stylistic errors, and suspicious constructs. The term originates from a Unix utility that examined C language source code.


The analysis performed by lint-like tools can also be performed by an optimizing compiler, which aims to generate faster code. In his original 1978 paper, Johnson addressed this issue, concluding that "the general notion of having two programs is a good one" because they concentrated on different things, thereby allowing the programmer to "concentrate at one stage of the programming process solely on the algorithms, data structures, and correctness of the program, and then later retrofit, with the aid of lint, the desirable properties of universality and portability"

Even though modern compilers have evolved to include many of lint's historical functions, lint-like tools have also evolved to detect an even wider variety of suspicious constructs. These include "warnings about syntax errors, uses of undeclared variables, calls to deprecated functions, spacing and formatting conventions, misuse of scope, implicit fallthrough in switch statements, missing license headers, [and]...dangerous language features.

Lint-like tools are especially useful for interpreted languages like JavaScript and Python. Because such languages lack a compiling phase that displays a list of errors prior to execution, the tools can also be used as simple debuggers for common errors (e.g. syntactic discrepancies) as well as hard-to-find errors such as heisenbugs (drawing attention to suspicious code as "possible errors"). Lint-like tools generally perform static analysis of source code.

## Following Errors would be checked in Unit testing by RSpec, to run test take a look at Getting start

- Expected newline after ';' in a multi-line declaration block
- Expected indentation of 2 spaces
- Expected single space after ':' with a single-line declaration"
- Unexpected whitespace bofore 
- Unexpected whitespace at the end of the line'
- Expected single space before
- Expected new line
- Expected indentation of 0 spaces before '}'
- Expected newline before '}' of a multi-line block"
- Unexpected empty line in rule body

## Built With

- Ruby 2.6

## Getting start

In order to start with the project:

1. You need to have ruby environment installed. [Click here for instructions](https://www.ruby-lang.org/en/documentation/installation/)
2. Clone this repository `https://github.com/Bekhzod96/Linter.git`
3. Run the algorithm file
    - In a terminal window write `ruby `*`[your_file_path]`*`ruby_linter.rb`
4. Run the Unit test
    - In a terminal window write `rspec`
5. Run own personal CSS file 
    - In the directory src file enter your file
    - in bin\ruby_linter.rb on line 3 Test.new('./src/[your_file]')
    
## Author

👤 **Bekhzod Akhrorov**

- Github:[@Bekhzod96](https://github.com/Bekhzod96)
- Twitter: [ @Begzod](https://twitter.com/25d47e8987f740b)
- Linkedin:[@Bekhzod AKhrorov](https://www.linkedin.com/in/bekhzod-akhrorov-b24232113/)

## 🤝 Contributing

**Contributions, issues and feature requests are welcome!**
Feel free to check the [issues page](https://github.com/Bekhzod96/Linter/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Inspiration etc.

## 📝 License

This project is [MIT](lic.url) licensed.

