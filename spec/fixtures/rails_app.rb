require 'active_support/all'
require 'action_controller'
require 'action_dispatch'
require 'rails'

module Rails

  class App

    def env_config; {} end
    def env_defaults; {} end

    def routes
      @routes ||= ActionDispatch::Routing::RouteSet.new.tap do |routes|
        routes.draw do
          resource :users do
            get :missing, on: :member
            get :nils, on: :member
          end
        end
      end
    end

  end

  def self.application
    @app ||= App.new
  end

end

class ApplicationConroller < ActionController::Base
  include Rails.application.routes.url_helpers
end
