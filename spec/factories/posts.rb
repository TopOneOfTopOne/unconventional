FactoryGirl.define do
  factory :post do
    title Faker::Book.title
    description Faker::Hipster.paragraph
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'Test10.jpg')) }
    project
    user
  end
end
