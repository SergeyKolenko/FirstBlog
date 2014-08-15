require 'spec_helper'

describe PostsController do

  before(:each) do
    @post= FactoryGirl.create(:post)
  end

  describe 'Index' do
    it "should be success" do
      response.should be_success
    end

    it "should be redirect" do
      response.should_not be_redirect
    end

    it "has a 200 status code" do
      expect(response.status).to eq(200)
    end

  end

  describe 'Post create' do
    it "has a 302 status code" do
      post :create, :post=>{:title => @post.title, :body => @post.body}
      expect(response.status).to eq(302)
    end
    it "has a 200 status code at create with blank data" do
      post :create, :post=>{:title => nil, :body => nil}
      expect(response.status).to eq(200)
    end

    it "should be redirect after adding post" do
      post :create, :post=>{:title => "Test post", :body => "Test Body"}
      response.should be_redirect

    end
  end

  describe 'Post edit' do
    it "should be success" do
      patch :update, :id => @post.id, :post => {:title => "New Test post", :body => "New Test Body"}
      expect(response.status).to eq(302)
    end

    it "should be redirect" do
      patch :update, :id => @post.id, :post => {:title => "New Test post", :body => "New Test Body"}
      response.should be_redirect
    end
  end

  describe 'Post show' do
    it 'should be success' do
      get :show, :id => @post.id
      response.should be_success
    end
  end

  describe 'Post delete'  do
    it "has a 302 code at delete code" do
      delete :destroy, :id => @post.id
      expect(response.status).to eq(302)
    end
  end
end