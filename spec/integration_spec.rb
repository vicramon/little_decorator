require 'spec_helper'
require 'fixtures/rails_app'
require 'fixtures/user'
require 'fixtures/user_decorator'
require 'fixtures/users_controller'
require 'rspec/rails'

describe UsersController, type: :controller do

  it "has access to the decorate helper" do
    expect(UserDecorator).to receive(:new) do |record, view|
      expect(record).to be_an_instance_of User
    end
    get :show
  end

  it "passes empty-collections through" do
    expect(UserDecorator).not_to receive(:new)
    get :missing
  end

  it "passes empty-collections through" do
    expect(UserDecorator).not_to receive(:new)
    get :nils
  end

end
