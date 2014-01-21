module Calculator
  ##
  #
  class Lexer
    TOKENS = {
      /\d+\.+\d*/ => :T_FLOAT,
      /\d+/       => :T_INT,
      /\s+/       => nil,
      /\+/        => :T_ADD,
      /\*/        => :T_MUL,
      /\//        => :T_DIV,
      /\-/        => :T_SUB
    }

    CONVERSION = {
      :T_INT   => :to_i,
      :T_FLOAT => :to_f
    }

    ##
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
