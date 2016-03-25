class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts

  validates :title, length: { minimum: 3 }, presence: true
  #validates :description, presence: true
  validates :user, presence: true
end
