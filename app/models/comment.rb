class Comment < ActiveRecord::Base
  #attr_accessible :body, :post_id
  include Likeable
  validates_presence_of :body
  belongs_to :post
  belongs_to :user
end
