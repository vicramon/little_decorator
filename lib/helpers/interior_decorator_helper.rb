module InteriorDecoratorHelper

  def decorate(model)
    decorator_name = "#{model.class}Decorator"

    begin
      decorator = decorator_name.constantize
    rescue
      raise "#{decorator_name} doesn't exist or isn't loaded"
    end

    decorator.decorate(model)
  end

end
