require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :clothing do
    clothing_type 'Top'
    clothing_style "Sweater"
    color "Blue"
    weather "Any"
    user
    # image do Rack::Test::UploadedFile.new(
    #   Rails.root.join("spec/support/images/example.jpg"))

    image File.new(File.join(::Rails.root.to_s, "spec/support/images", "example.jpg"))
    end

end
