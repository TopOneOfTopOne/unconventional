FactoryGirl.define do
  factory :post do
    title Faker::Book.title
    picture "res.cloudinary.com/hwllnpiwd/image/upload/t_media_lib_thumb/sample.jpg"
    user
  end
end
