class LittleDecorator
  module Helper

    def decorate(item_or_collection)
      if item_or_collection.respond_to?(:map)
        item_or_collection.map{ |item| decorate(item) }
      else
        item = item_or_collection
        return item if LittleDecorator === item
        decorator = "#{item.class}Decorator".constantize
        decorator.new(item, self)
      end
    end
    alias_method :d, :decorate

  end
end
