class LittleDecorator
  module Helper

    def decorate(item_or_collection, decorate_nils: false)
      if item_or_collection.respond_to?(:map)
        item_or_collection.map{ |item| decorate(item) }
      else
        item = item_or_collection
        return nil if item.nil? && !decorate_nils
        
        decorator = "#{item.class}Decorator".constantize
        decorator.new(item, self)
      end
    end
    alias_method :d, :decorate

  end
end
