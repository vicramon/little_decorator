require 'spec_helper'
require 'fixtures/rails_app'
require 'fixtures/user'
require 'fixtures/user_decorator'
require 'fixtures/users_controller'
require 'rspec/rails'

describe UsersController, type: :controller do

  it "has access to the decorate helper" do
    expect(UserDecorator).to receive(:decorate) do |record, view|
      expect(record).to be_an_instance_of User
    end.and_return(instance_of UserDecorator)
    get :show
  end

end
