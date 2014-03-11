module InteriorDecoratorHelper

  def decorate(item)
    klass = item.respond_to?(:each) ? item.first.class : item.class
    decorator = "#{klass}Decorator".constantize
    decorator.decorate(item)
  end

end
