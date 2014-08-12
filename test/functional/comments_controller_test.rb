require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test  "should create comment without javascript" do
    p = Post.create!(:title => 'Hello', :body=>'World!')
    post :create, :post_id => p.id, :comment => { :body => 'nice'}
    assert_redirected_to post_url(p)
    assert_equal 'nice', p.comments.first.body
  end

  test "should create comment  and render RJS tamplate ajax" do
    p = Post.create!(:title => 'Hello', :body=>'World!')
    post :create, :format => 'js', :post_id => p.id, :comment => {:body => 'nice'}
    assert_template 'create.js'
    assert_equal 'nice', p.comments.first.body
    end

end
