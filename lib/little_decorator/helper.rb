class LittleDecorator
  module Helper

    def decorate(item_or_collection)
      if item_or_collection.respond_to?(:map)
        item_or_collection.map{ |item| decorate(item) }
      else
        item = item_or_collection
        raise_argument_error if item.nil?
        return item     if LittleDecorator === item
        decorator = "#{item.class}Decorator".constantize
        decorator.new(item, self)
      end
    end
    alias_method :d, :decorate

    private

    def raise_argument_error
      raise ArgumentError, 'A nil was passed into the decorator.'
    end

  end
end
