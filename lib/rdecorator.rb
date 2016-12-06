require "rdecorator/version"

module Rdecorator

  def method_added(method_name)

    unless decorator_methods.empty?

      decorator_method = decorator_methods.pop

      new_name = "#{method_name}_without_decorator"

      alias_method new_name, method_name

      define_method method_name do |*args|

        fn = method(new_name)

        callback = Proc.new {|p = args| fn.call(*p)}

        if decorator_method.kind_of? Class
          decorator_method.new(fn, *args).call &callback
        else
          method(decorator_method).call fn, *args, &callback
        end

      end

    end

  end

  def wrap(decorator)
    decorator_methods << decorator
  end

  alias_method :decorator, :wrap

  def decorator_methods
    @decorator_methods ||= []
  end

end
