class InteriorDecoratorRailtie < Rails::Railtie

  initializer "interior_decorator.configure_rails" do |app|
    get_route_helpers(app)
  end

  def get_route_helpers(app)
    InteriorDecoratorRoutes.include app.routes.url_helpers
  end

end
