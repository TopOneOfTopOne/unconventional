FactoryGirl.define do
  factory :project do
    title Faker::Book.title
    description Faker::Hipster.paragraph
    user
  end
end
