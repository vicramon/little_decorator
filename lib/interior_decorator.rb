require 'helpers/interior_decorator_helper'
require 'interior_decorator/railtie'
require 'interior_decorator/routes'

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

  def helper
    ActionController::Base.helpers
  end
  alias_method :h, :helper

  def route
    @_route_helper ||= InteriorDecoratorRoutes.instance
  end
  alias_method :r, :route

  def method_missing(method_name, *args, &block)
    if model.respond_to?(method_name)
      model.public_send(method_name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    model.respond_to?(method_name, include_private)
  end
end
