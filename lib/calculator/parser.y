class Calculator::Parser
token T_INT T_FLOAT T_ADD T_DIV T_MUL T_SUB

prechigh
  left T_MUL T_DIV T_ADD T_SUB
preclow

rule
  root
    : expression
    : number
    ;

  expression
    : expression action expression
    | number
    ;

  action
    : T_ADD
    | T_DIV
    | T_MUL
    | T_SUB
    ;

  number
    : T_INT
    | T_FLOAT
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

# vim: set ft=racc:
