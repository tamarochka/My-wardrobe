require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :my_file do
    photo Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/myfile.jpg')))
  end


  factory :top do
    top_type 'sweater'
    color 'white'
    pic 'link/to/picture'
  end

end
