require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end


  factory :top do
    top_type 'Sweater'
    color 'white'
    pic "public/uploads/top/example.jpg"
  end

  factory :bottom do
    bottom_type 'Shorts'
    color 'Blue'
    pic "public/uploads/bottom/example.jpg"
  end

end
