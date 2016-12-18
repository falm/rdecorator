require 'spec_helper'

describe Rdecorator do

  class Decorator

    def initialize(this, *args)
      @this = this
      @args = args
    end

    def call
      @this.call(*@args) << ' php'
    end

  end

  module DecoratorMethods

    def ruby(*)
      [yield, 'ruby'].join(' ')
    end

    def python(*)
      [yield, 'python'].join(' ')
    end

  end

  class DummyClass

    extend Rdecorator
    include DecoratorMethods

    wrap :ruby
    def great
      'great'
    end

    decorator :python
    def not_bad
      'not bad'
    end

    decorator Decorator
    def best
      'best in the world'
    end

  end

  subject { DummyClass.new }

  it 'normal' do
    expect(subject.great).to include 'great'
  end

  describe 'simple pattern' do

    it 'wrap decorate' do
      expect(subject.great).to eq 'great ruby'
    end

    it 'decorator alias' do
      expect(subject.not_bad).to eq 'not bad python'
    end

  end

  describe 'Decorator class' do

    it 'php' do
      expect(subject.best).to eq 'best in the world php'
    end

  end


end