require 'active_support/concern'
class LittleDecorator
  module Helper
    extend ActiveSupport::Concern
    included { helper_method :decorate, :d }

    def decorate(item)
      klass = Array(item).first.class
      decorator = "#{klass}Decorator".constantize
      decorator.decorate(item, view_context)
    end
    alias_method :d, :decorate
  end
end
