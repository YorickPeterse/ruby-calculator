class Calculator::Parser

# These are the token types Racc should know about. They are the same as the
# lexer's token types.
token T_INT T_FLOAT T_ADD T_DIV T_MUL T_SUB T_MOD T_EXP

options no_result_var

# This defines the operator precedence of various operators. This precedence is
# based on what is used by the Unix `bc` command.
prechigh
  left T_MUL T_DIV T_MOD T_EXP
  left T_ADD T_SUB
preclow

# Defines the rules of the parser.
rule
  # `document` is the top level rule and defines what an entire document can
  # contain. In this case it can either contain an `expression` or nothing.
  #
  # The bits between { and } will be executed whenever a rule is processed. In
  # this case when `expression` is found it simply returns whatever value it
  # contains.
  document
    : expression { val }
    | /* none */ { [] }
    ;

  # An `expression` is either a number or a combination of an `expression`,
  # token and another `expression`.
  expression
    : expression T_MUL expression { [:mul, val[0], val[2]] }
    | expression T_ADD expression { [:add, val[0], val[2]] }
    | expression T_SUB expression { [:sub, val[0], val[2]] }
    | expression T_DIV expression { [:div, val[0], val[2]] }
    | expression T_MOD expression { [:mod, val[0], val[2]] }
    | expression T_EXP expression { [:exp, val[0], val[2]] }
    | number
    ;

  # Numbers are either integers or floats. Shocking.
  number
    : T_INT   { [:int, val[0]] }
    | T_FLOAT { [:float, val[0]] }
    ;
end

# This bit will end up inside the parser's body.

---- inner
  ##
  # Returns the next token to process.
  #
  # @return [Array]
  #
  def next_token
    @tokens.shift
  end

  ##
  # Lexes and parses the given string.
  #
  # @param [String] string
  # @return [Array]
  #
  def parse(string)
    lexer   = Lexer.new
    @tokens = lexer.lex(string)

    do_parse
  end

# vim: set ft=racc:
