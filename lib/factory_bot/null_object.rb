module FactoryBot
  # @api private
  class NullObject < ::BasicObject
    def initialize(methods_to_respond_to)
      @methods_to_respond_to = methods_to_respond_to.map(&:to_s)
    end

    def method_missing(name, *args, &block)
      return if respond_to?(name)
      super
    end

    def respond_to?(method, _include_private = false)
      @methods_to_respond_to.include? method.to_s
    end

    def respond_to_missing?(*)
      false
    end
  end
end
