require 'factory_girl'

FactoryGirl.define do
  factory :admin_user do
    id "2"
    email "admin@example.com"
    password "password"
    password_confirmation "password"
  end
end