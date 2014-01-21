class Calculator::Parser
token int float add div mul sub
rule
  action
    : add
    | div
    | mul
    | dub
    ;

  expression
    : expression + action + expression
    | number
    ;

  number
    : int
    | float
    ;
end

# vim: set ft=racc:
