require 'spec_helper'
include LittleDecorator::Helper

describe 'LittleDecorator::Helper' do

  context '#decorate is called on a nil record' do
    it 'raises an ArgumentError if the model is nil' do
      expect{ decorate(nil) }.to raise_error(ArgumentError)
    end
  end

end


