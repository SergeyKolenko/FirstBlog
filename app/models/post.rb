class Post < ActiveRecord::Base
  #attr_accessible :body, :title
  include Likeable
  validates_presence_of :body, :title
  has_many :comments
  belongs_to :user
end
