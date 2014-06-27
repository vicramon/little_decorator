module InteriorDecorators
  module Generators
    class DecorateGenerator < Rails::Generators::Base
      argument :model_name, type: :string
      def create_interior_decorator

        puts("\n\nI tried to create something\n\n\n")
        filename = model_name.underscore + "_decorator.rb"
        template "decorator.erb", File.join('app/decorators',filename)
      end

      def self.source_root
         File.join(File.dirname(__FILE__), 'templates')
      end
    end
  end
end