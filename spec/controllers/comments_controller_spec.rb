require 'spec_helper'

describe CommentsController do

  before(:each) do
    @post = FactoryGirl.create(:post)
  end

  describe 'Comment create' do
    it 'has 302 status code' do
    post :create, :comment => {:body => "New Some body"}, :post_id => @post.id
    expect(response.status).to eq(302)
    end
    end
end