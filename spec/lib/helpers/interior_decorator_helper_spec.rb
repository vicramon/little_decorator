class ActionView; module Base; end; end

require 'rails'

require 'interior_decorator'
require 'helpers/interior_decorator_helper'
require 'fixtures/user'
require 'fixtures/user_decorator'
require 'pry_debug'

class DummyClass; end;
class DummyClassDecorator < InteriorDecorator; end;
describe InteriorDecoratorHelper do
  
  let(:helper) { DummyClass.new.extend(described_class)}
  
  let(:item) { User.new }
  let(:simple_item_array) {  [User.new, User.new] }
  let(:complex_item_array) {  [User.new, User.new, DummyClass.new] }
  let(:collection_of_collections) { [simple_item_array, complex_item_array, nil, User.new] }

  it "should pass a simple smoke test" do
    expect(true).to be_true
  end

  context "solo item" do
    it "should be able to decorate an item" do
      expect(helper.decorate(item)).to be_kind_of(UserDecorator)
    end
  end


  context "decorating simple collections" do
    let(:decorated_array) { helper.decorate(simple_item_array) }
    it { expect(decorated_array.first).to be_kind_of(UserDecorator) }
    it { expect(decorated_array.last).to be_kind_of(UserDecorator) }
  end

  context "decorating complex collections" do
    let(:decorated_array) { helper.decorate(complex_item_array) }
    it { expect(decorated_array.first).to be_kind_of(UserDecorator) }
    it { expect(decorated_array[1]).to be_kind_of(UserDecorator) }
    it { expect(decorated_array[2]).to be_kind_of(DummyClassDecorator) }
  end


  context "decorating collections of collections, recursion works for me" do
    let(:decorated_array) { helper.decorate(collection_of_collections) }
    
    it { expect(decorated_array.last).to be_kind_of(UserDecorator)}
    
    describe "first array" do
      let(:first_array) { decorated_array.first }
      it { expect(first_array.first).to be_kind_of(UserDecorator) }
      it { expect(first_array.last).to be_kind_of(UserDecorator) }
    end
    
    describe "second array" do
      let(:second_array) { decorated_array[1] }
      it { expect(second_array.first).to be_kind_of(UserDecorator) }
      it { expect(second_array[1]).to be_kind_of(UserDecorator) }
      it { expect(second_array[2]).to be_kind_of(DummyClassDecorator) }
    end
  end
end