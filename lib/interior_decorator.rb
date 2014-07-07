require 'helpers/interior_decorator_helper'

class InteriorDecorator

  attr_reader :model

  def self.decorate(item)
    if item.respond_to?(:map)
      item.map { |object| new(object) }
    else
      new(item)
    end
  end

  def initialize(model)
    @model = model
  end

  def h
    ActionController::Base.helpers
  end

  def method_missing(method_name, *args, &block)
    if model.respond_to?(method_name)
      model.public_send(method_name, *args, &block)
    else
      super
    end
  end

end
