require 'spec_helper'

describe Comment do
  context 'validation' do

    before(:each) do
      @comment = FactoryGirl.create(:comment)
    end

    it 'it valid with valid attr' do
      @comment.should be_valid
    end
  end

  context 'association' do
    it 'should belong to post' do
      should belong_to(:post)
    end
  end
end