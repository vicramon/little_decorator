require 'active_support/concern'

class LittleDecorator
  module Helper
    extend ActiveSupport::Concern
    included { helper_method :decorate, :d }

    def decorate(item_or_collection)
      if item_or_collection.respond_to?(:map)
        item_or_collection.map{ |item| decorate(item) }
      else
        item = item_or_collection
        decorator = "#{item.class}Decorator".constantize
        decorator.new(item, view_context)
      end
    end
    alias_method :d, :decorate
  end
end
