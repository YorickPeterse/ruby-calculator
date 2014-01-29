# Ruby Calculator

A basic calculator written in Ruby, featuring a custom lexer and parser. This
repository is meant for educational purposes primarily in the field of writing
programming languages. It is not a webscale replacement for `bc`.

The idea is to use this repository to explain the steps of writing programming
languages and how one can do so. It also serves as a playground for students
(and myself) to mess around.

## Requirements

* Ruby 1.9.3 or newer
* Bundler

## Getting Started

Assuming you have a clone of this repository, first install the Gems:

    bundle install

Then run the tests to see if everything is working:

    rake

Happy coding!

## Structure

The project is divided into 3 categories:

1. The lexer
2. The parser
3. The evaluator

The basics of these categories are discussed below.

### Lexer

A lexer is an application that takes text and turns it into tokens. The term
"token" is pretty abstract but what it means is that it's a "thing" that
typically contains the following information:

1. The type of thing
2. The actual value

For example, a lexer could process the input `10` and return the following
tokens:

    [[:T_INT, 10]]

The `:T_INT` is a Ruby Symbol and is used to indicate the type, `10` is the
actual value of the token.

Although simple lexers can be written by hand the more complicated ones are
often written using tools such as [Ragel][ragel]. These tools often allow you
to keep track of state, do things based on contexts and so forth.

Wikipedia article: <https://en.wikipedia.org/wiki/Lexical_analysis>

### Parser

The term "parser" is fairly abstract and can be quite confusing depending on
the context that it is used in. In the field of programming languages these
parsers are typically used to build an Abstract Syntax Tree (AST) based on a
list of tokens supplied by a lexer. The latter isn't always the case, some
parsers don't require a separate lexing stage.

The way parsers work is that you typically define a sequence of tokens and a
corresponding action to run when a sequence is found. For example, you could
have it run something when a integer was found followed by another integer.
This allows for the construction of complex ASTs based on contexts, sequences
of tokens and so forth.

Although parsers can be written by hand they are often generated due to their
complexity. In Ruby a tool that can be used for that (and is used for this
particular project) is [Racc][racc].

Wikipedia article: <https://en.wikipedia.org/wiki/LALR_parser>

### Evaluator

The evaluator (other names being "virtual machine" and "interpreter") takes a
set of instructions and executes them. In case of this calculator it iterates
over the AST produced by the parser and executes certain operations.

Typically there's an extra step in between where the AST is converted to a more
simplified set of instructions, these instructions are then executed (instead
of the AST being used directly). This calculator does not use this extra step
due to the extra complexity of doing so.

Wikipedia article: <https://en.wikipedia.org/wiki/Interpreter_(computing)>

[ragel]: http://www.complang.org/ragel/
[racc]: https://github.com/tenderlove/racc
