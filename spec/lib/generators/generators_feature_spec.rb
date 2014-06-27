require 'rails'

class Application < ::Rails::Application; end

require 'pry_debug'
require 'ammeter/init'
require 'generators/interior_decorator_generator'

def pry_in
  PryDebug.pry
end
TMP_ROOT = Pathname.new(Dir.tmpdir)


RSpec.configure do |config|

  real_world = nil
  config.before(:each) do
    real_world = RSpec.world
    RSpec.instance_variable_set(:@world, RSpec::Core::World.new)
  end
  config.after(:each) do
    RSpec.instance_variable_set(:@world, real_world)
  end
end

describe "In order to easily generate decorator objects" +
        "As a user of Rails and Interior Decorator" +
        "I would like to be able to use interior_decorator generators" do
  it "should pass smoke test" do
    expect(true).to eql true
  end

  describe InteriorDecorators::Generators::InteriorDecoratorGenerator, type: :generator do
    destination TMP_ROOT 
    before { prepare_destination }
  
    it "should run all tasks in generator" do
      gen = generator %w(decorator)
      gen.should_receive :create_interior_decorator
      capture(:stdout) { gen.invoke_all }
    end

    describe "the generated file" do
      context "single case" do
        before { run_generator %w(user) }
        describe "the file" do
          subject {file('app/decorators/user_decorator.rb') }
          it { should exist }
          it { should contain(/class UserDecorator < InteriorDecorator/) }
          it { should contain(/end/) }
        end
      end

      context "camel case" do
        before { run_generator %w(AdminUser) }
        describe "the file" do
          subject {file('app/decorators/admin_user_decorator.rb') }
          it { should exist }
          it { should contain(/class AdminUserDecorator < InteriorDecorator/) }
          it { should contain(/end/) }
        end
      end


      context "snake case" do
        before { run_generator %w(admin_user) }
        describe "the file" do
          subject {file('app/decorators/admin_user_decorator.rb') }
          it { should exist }
          it { should contain(/class AdminUserDecorator < InteriorDecorator/) }
          it { should contain(/end/) }
        end
      end
    end
  end
end