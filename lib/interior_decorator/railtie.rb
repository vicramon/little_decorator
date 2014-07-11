class InteriorDecoratorRailtie < Rails::Railtie

  initializer "interior_decorator.configure_rails" do |app|
    get_route_helpers(app)
    setup_decorate_helper
  end

  def get_route_helpers(app)
    InteriorDecoratorRoutes.include app.routes.url_helpers
  end

  def setup_decorate_helper
    ActionView::Base.send :include, InteriorDecoratorHelper
  end

end
