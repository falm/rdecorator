require 'spec_helper'

describe Rdecorator do

  class Decorator

    def initialize(this, *args)
      @this = this
      @args = args
    end

    def call
      @this.call(*args)
    end

  end

  module DecoratorMethods

    def prefix(*)
      'prefix' << yield
    end

    def suffix(*)
       yield << 'suffix'
    end

  end

  class DummyClass

    extend Rdecorator
    include DecoratorMethods

    wrap :prefix
    def first
      'first'
    end

    decorator :suffix
    def second
      'second'
    end

    wrap Decorator
    def third
      'third'
    end

  end

  subject { DummyClass.new }

  it 'normal' do
    expect(subject.first).to include 'first'
  end

end