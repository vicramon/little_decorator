require 'spec_helper'
require 'fixtures/user'
require 'fixtures/user_decorator'

describe LittleDecorator do

  let(:record) { User.new }
  subject { UserDecorator.new(record, nil) }

  it 'returns a decorated version of an object' do
    expect(subject).to be_instance_of UserDecorator
  end

  it 'can call methods on the model' do
    expect(subject.full_name).to eq 'Kevin Spacey'
  end

  it 'returns an overloaded method from the decorator' do
    expect(subject.favorite_food).to eq 'pie'
  end

  it 'sends missing methods to the model' do
    expect(subject.likes_dogs).to be true
  end

  it 'can explicitly call model methods' do
    expect(subject.likes_to_bake).to eq 'cake'
  end

  it 'forwards respond_to? calls to the model when not found' do
    expect(subject.respond_to?(:first_name)).to be true
  end

end
