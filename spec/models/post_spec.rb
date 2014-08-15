require 'spec_helper'

describe Post do
  context 'validates' do
    before(:each) do
      @post = FactoryGirl.create(:post)
    end

    it 'is valid with valid attr' do
      @post.should be_valid
    end

    it 'is not valid without title' do
      @post.title = nil
      @post.should_not be_valid
    end

    it 'is not valid without body' do
      @post.body = nil
      @post.should_not be_valid
    end
  end

  context 'associations' do
    it 'should have many comments' do
      should have_many(:comments)
    end
  end
end