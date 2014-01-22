require 'spec_helper'

describe Calculator::Evaluator do
  before do
    @parser    = Calculator::Parser.new
    @evaluator = Calculator::Evaluator.new
  end

  context 'addition' do
    example 'add two integers' do
      ast    = @parser.parse('10 + 20')
      result = @evaluator.evaluate(ast)

      result.should == 30
    end

    example 'add three integers' do
      ast    = @parser.parse('10 + 20 + 30')
      result = @evaluator.evaluate(ast)

      result.should == 60
    end

    example 'add an integer and a float' do
      ast    = @parser.parse('10.5 + 2')
      result = @evaluator.evaluate(ast)

      result.should == 12.5
    end
  end

  context 'subtraction' do
    example 'subtract two integers' do
      ast    = @parser.parse('10 - 2')
      result = @evaluator.evaluate(ast)

      result.should == 8
    end

    example 'subtract three integers' do
      ast    = @parser.parse('10 - 2 - 4')
      result = @evaluator.evaluate(ast)

      result.should == 4
    end
  end

  context 'multiplication' do
    example 'multiply two integers' do
      ast    = @parser.parse('10 * 2')
      result = @evaluator.evaluate(ast)

      result.should == 20
    end

    example 'multiply three integers' do
      ast    = @parser.parse('10 * 2 * 5')
      result = @evaluator.evaluate(ast)

      result.should == 100
    end
  end

  context 'division' do
    example 'divide two integers' do
      ast    = @parser.parse('10 / 2')
      result = @evaluator.evaluate(ast)

      result.should == 5
    end

    example 'divide three integers' do
      ast    = @parser.parse('10.0 / 2 / 2')
      result = @evaluator.evaluate(ast)

      result.should == 2.5
    end
  end
end
