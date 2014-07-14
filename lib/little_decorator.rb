require 'little_decorator/helper'
ActiveSupport.on_load(:action_controller) { include LittleDecorator::Helper }

class LittleDecorator
  attr_reader :record, :view

  def self.decorate(record_or_collection, view)
    if record_or_collection.respond_to?(:map)
      record_or_collection.map { |record| new(record, view) }
    else
      new(record_or_collection, view)
    end
  end

  def initialize(record, view)
    @record, @view = record, view
  end
  alias_method :model, :record

  def method_missing(method_name, *args, &block)
    [record, view].each do |item|
      return item.public_send(method_name, *args, &block) if item.respond_to?(method_name)
    end
    super
  end

  def respond_to_missing?(method_name, include_private=false)
    [record, view].any? { |item| item.respond_to?(method_name, include_private) }
  end
end
