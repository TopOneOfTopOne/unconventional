class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, length: { minimum: 3 }, presence: true
  #validates :description, presence: true
  #validates :picture, presence: true
  validates :user, presence: true

  mount_uploader :picture, ImageUploader
end
