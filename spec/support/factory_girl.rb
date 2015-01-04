require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :top do
    top_type 'sweater'
    color 'white'
    pic 'link/to/picture'
  end

end
