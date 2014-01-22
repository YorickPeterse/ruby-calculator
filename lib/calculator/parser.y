class Calculator::Parser
token T_INT T_FLOAT T_ADD T_DIV T_MUL T_SUB
options no_result_var

prechigh
  # FIXME: operator precedence is currently broken, it doesn't behave like bc.
  left T_ADD T_SUB T_MUL T_DIV
preclow

rule
  document
    : expression { val }
    | /* none */ { [] }
    ;

  expression
    : expression T_MUL expression { [:mul, val[0], val[2]] }
    | expression T_ADD expression { [:add, val[0], val[2]] }
    | expression T_SUB expression { [:sub, val[0], val[2]] }
    | expression T_DIV expression { [:div, val[0], val[2]] }
    | number
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

# vim: set ft=racc:
