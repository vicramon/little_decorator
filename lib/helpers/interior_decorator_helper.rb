module InteriorDecoratorHelper

  def decorate(item)
    klass = Array(item).first.class
    decorator = "#{klass}Decorator".constantize
    decorator.decorate(item)
  end
  alias_method :d, :decorate

end
