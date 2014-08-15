require 'factory_girl'

FactoryGirl.define do
  factory :comment do
    id 102
    post_id 292
    body "some body comment"
  end
end