require 'spec_helper'

describe Calculator::Evaluator do
  before do
    @evaluator = Calculator::Evaluator.new
  end

  context 'addition' do
    example 'add two integers' do
      @evaluator.evaluate_string('10 + 20').should == 30
    end

    example 'add three integers' do
      @evaluator.evaluate_string('10 + 20 + 30').should == 60
    end

    example 'add an integer and a float' do
      @evaluator.evaluate_string('10.5 + 2').should == 12.5
    end
  end

  context 'subtraction' do
    example 'subtract two integers' do
      @evaluator.evaluate_string('10 - 2').should == 8
    end

    example 'subtract three integers' do
      @evaluator.evaluate_string('10 - 2 - 4').should == 4
    end
  end

  context 'multiplication' do
    example 'multiply two integers' do
      @evaluator.evaluate_string('10 * 2').should == 20
    end

    example 'multiply three integers' do
      @evaluator.evaluate_string('10 * 2 * 5').should == 100
    end
  end

  context 'division' do
    example 'divide two integers' do
      @evaluator.evaluate_string('10 / 2').should == 5
    end

    example 'divide two integers and a float' do
      @evaluator.evaluate_string('10.0 / 2 / 2').should == 2.5
    end
  end

  context 'modulo' do
     example 'modulo two integers' do
      @evaluator.evaluate_string('10 % 6').should == 4
    end

    example 'modulo three integers' do
      @evaluator.evaluate_string('10 % 6 % 2').should == 0
    end
  end

  context 'exponent' do
     example 'find exponent two integers' do
      @evaluator.evaluate_string('2 ^ 3').should == 8
    end

    example 'find exponent three integers' do
      @evaluator.evaluate_string('2 ^ 3 ^ 2').should == 64
    end
  end

end
