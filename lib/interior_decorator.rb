require 'helpers/interior_decorator_helper'

ActiveSupport.on_load :action_controller do
  include InteriorDecoratorHelper
end

class InteriorDecorator

  attr_reader :record, :view

  def self.decorate(record_or_collection, view)
    if record_or_collection.respond_to?(:map)
      record_or_collection.map { |record| new(record, view) }
    else
      new(record_or_collection, view)
    end
  end

  def initialize(record, view)
    @record = record
    @view = view
  end
  alias_method :model, :record

  def method_missing(method_name, *args, &block)
    if record.respond_to?(method_name)
      record.public_send(method_name, *args, &block)
    elsif view.respond_to?(method_name)
      view.public_send(method_name, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private=false)
    [record, view].any? { |item| item.respond_to?(method_name, include_private) }
  end

end
