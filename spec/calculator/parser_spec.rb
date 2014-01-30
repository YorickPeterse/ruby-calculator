require 'spec_helper'

describe Calculator::Parser do
  before do
    @parser = Calculator::Parser.new
  end

  context 'numerical values' do
    example 'parse an integer' do
      @parser.parse('10').should == [[:int, 10]]
    end

    example 'parse a float' do
      @parser.parse('10.5').should == [[:float, 10.5]]
    end
  end

  context 'addition' do
    example 'add two integers' do
      @parser.parse('10 + 20').should == [[:add, [:int, 10], [:int, 20]]]
    end

    example 'add two floats' do
      @parser.parse('10.5 + 20.5').should == [
        [:add, [:float, 10.5], [:float, 20.5]]
      ]
    end

    example 'add three integers' do
      @parser.parse('10 + 20 + 30').should == [
        [:add, [:add, [:int, 10], [:int, 20]], [:int, 30]]
      ]
    end
  end

  context 'subtraction' do
    example 'subtract two integers' do
      @parser.parse('10 - 20').should == [[:sub, [:int, 10], [:int, 20]]]
    end

    example 'subtract two floats' do
      @parser.parse('10.5 - 20.5').should == [
        [:sub, [:float, 10.5], [:float, 20.5]]
      ]
    end

    example 'subtract three integers' do
      @parser.parse('10 - 20 - 30').should == [
        [:sub, [:sub, [:int, 10], [:int, 20]], [:int, 30]]
      ]
    end
  end

  context 'multiplication' do
    example 'multiply two integers' do
      @parser.parse('10 * 20').should == [[:mul, [:int, 10], [:int, 20]]]
    end

    example 'multiply two floats' do
      @parser.parse('10.5 * 20.5').should == [
        [:mul, [:float, 10.5], [:float, 20.5]]
      ]
    end

    example 'multiply three integers' do
      @parser.parse('10 * 20 * 30').should == [
        [:mul, [:mul, [:int, 10], [:int, 20]], [:int, 30]]
      ]
    end
  end

  context 'division' do
    example 'divide two integers' do
      @parser.parse('10 / 20').should == [[:div, [:int, 10], [:int, 20]]]
    end

    example 'divide two floats' do
      @parser.parse('10.5 / 20.5').should == [
        [:div, [:float, 10.5], [:float, 20.5]]
      ]
    end

    example 'divide three integers' do
      @parser.parse('10 / 20 / 30').should == [
        [:div, [:div, [:int, 10], [:int, 20]], [:int, 30]]
      ]
    end
  end

  context 'operator precedence' do
    example 'divide two integers and add one' do
      @parser.parse('10 + 10 / 2').should == [
        [:add, [:int, 10], [:div, [:int, 10], [:int, 2]]]
      ]
    end
  end
end

