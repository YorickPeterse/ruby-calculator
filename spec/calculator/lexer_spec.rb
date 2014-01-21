require 'spec_helper'

describe Calculator::Lexer do
  context 'numerical values' do
    example 'lex an integer' do
      Calculator::Lexer.new('10').lex.should == [[:int, 10]]
    end

    example 'lex a float' do
      Calculator::Lexer.new('10.5').lex.should == [[:float, 10.5]]
    end
  end

  example 'lex an addition expression' do
    Calculator::Lexer.new('10 + 20').lex
      .should == [[:int, 10], [:add], [:int, 20]]
  end

  example 'lex a multiplication expression' do
    Calculator::Lexer.new('10 * 2').lex
      .should == [[:int, 10], [:mul], [:int, 2]]
  end

  example 'lex a division expression' do
    Calculator::Lexer.new('10 / 2').lex
      .should == [[:int, 10], [:div], [:int, 2]]
  end

  example 'lex a subtraction expression' do
    Calculator::Lexer.new('10 - 2').lex
      .should == [[:int, 10], [:sub], [:int, 2]]
  end
end
