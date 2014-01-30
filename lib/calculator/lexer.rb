module Calculator
  ##
  # The Lexer takes a raw String and returns a list of tokens containing
  # information about the input. Tokens are Arrays with two values: the type
  # and optionally the value.
  #
  # For example:
  #
  #     10
  #
  # This would produce the following tokens:
  #
  #     [[:T_INT, 10]]
  #
  class Lexer
    ##
    # List of patterns and the corresponding token names. Token names set to
    # `nil` will be ignored by {#lex}.
    #
    # @return [Hash]
    #
    TOKENS = {
      /\d+\.+\d*/ => :T_FLOAT,
      /\d+/       => :T_INT,
      /\s+/       => nil,
      /\+/        => :T_ADD,
      /\*/        => :T_MUL,
      /\//        => :T_DIV,
      /\-/        => :T_SUB,
      /\%/        => :T_MOD,
      /\^/        => :T_EXP
    }

    ##
    # Methods to invoke on token values to convert them to the right types.
    #
    # @return [Hash]
    #
    CONVERSION = {
      :T_INT   => :to_i,
      :T_FLOAT => :to_f
    }

    ##
    # Lexes the given string and returns a sequence of tokens.
    #
    # @example
    #  lex('10') # => [[:T_INT, 10]]
    #
    # @return [Array]
    #
    def lex(string)
      scanner = StringScanner.new(string)
      tokens  = []

      until scanner.eos?
        token = next_token(scanner)

        tokens << token if token
      end

      return tokens
    end

    ##
    # Scans for the next token in the given StringScanner instance. If no token
    # is found `nil` is returned.
    #
    # @param [StringScanner] scanner
    # @return [Array]
    #
    def next_token(scanner)
      token = nil

      TOKENS.each do |pat, type|
        found = scanner.scan(pat)

        if found and type
          token = [type, nil]

          if CONVERSION[type]
            token[1] = found.send(CONVERSION[type])
          end

          break
        end
      end

      return token
    end
  end # Lexer
end # Calculator
