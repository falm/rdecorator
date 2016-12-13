require 'spec_helper'

describe Rdecorator do

  class Decorator

    def initialize(this, *args)

    end

    def call

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

    around :suffix
    def second
      'second'
    end

    wrap Decorator
    def third
      'third'
    end

  end

  it '' do

  end

end