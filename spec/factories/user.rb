require 'factory_girl'

FactoryGirl.define do
  factory :user do
    id "512"
    email "adr@email.com"
    password "12345678"
    password_confirmation "12345678"
  end
end