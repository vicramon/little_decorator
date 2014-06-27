module InteriorDecoratorHelper

  def decorate(item)
    if item.respond_to?(:each) #? item.first.class : item.class
      decorated = item.collect{|n| decorate_single_item(n)}
    else
      decorated = decorate_single_item item
    end
    decorated
  end

  def decorate_single_item(item)
    return nil if item.nil?
    return decorate(item) if item.respond_to?(:each)
    klass = item.class 
    decorator = "#{klass}Decorator".constantize
    decorator.decorate(item)
  end
end

ActionView::Base.send :include, InteriorDecoratorHelper
