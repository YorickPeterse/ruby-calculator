class Calculator::Parser
token T_INT T_FLOAT T_ADD T_DIV T_MUL T_SUB
options no_result_var

prechigh
  left T_ADD T_SUB T_MUL T_DIV
preclow

rule
  document
    : expression { val }
    | /* none */ { [] }
    ;

  expression
    : expression action expression { [val[1], val[0], val[2]] }
    | number
    ;

  action
    : T_ADD { :add }
    | T_DIV { :div }
    | T_MUL { :mul }
    | T_SUB { :sub }
    ;

  number
    : T_INT   { [:int, val[0]] }
    | T_FLOAT { [:float, val[0]] }
    ;
end

---- inner

  def next_token
    @tokens.shift
  end

  def parse(string)
    lexer   = Lexer.new
    @tokens = lexer.lex(string)

    do_parse
  end

---- header

  require 'pry'

# vim: set ft=racc:
