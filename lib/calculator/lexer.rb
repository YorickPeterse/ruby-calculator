module Calculator
  ##
  #
  class Lexer
    attr_reader :string

    TOKENS = {
      /\d+\.+\d*/ => :float,
      /\d+/       => :int,
      /\s+/       => nil,
      /\+/        => :add,
      /\*/        => :mul,
      /\//        => :div,
      /\-/        => :sub
    }

    ##
    # @param [String] string
    #
    def initialize(string)
      @string = string
      @scanner = StringScanner.new(string)
    end

    ##
    # @return [Array]
    #
    def lex
      tokens = []

      until @scanner.eos?
        token = next_token

        tokens << token if token
      end

      return tokens
    end

    def next_token
      token = nil

      TOKENS.each do |pat, type|
        found = @scanner.scan(pat)

        if found and type
          token = [type]

          if type == :int
            token << found.to_i
          elsif type == :float
            token << found.to_f
          end

          break
        end
      end

      return token
    end
  end # Lexer
end # Calculator
