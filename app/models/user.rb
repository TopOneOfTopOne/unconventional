class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable, :recoverable, :rememberable, :trackable, :validatable

has_many :posts
has_many :projects 

enum role: [:standard, :premium, :admin]
after_initialize :set_default_role, :if => :new_record?

validates :username, presence: true, uniqueness: true, length: { maximum: 24 }

def set_default_role
  self.role ||= :standard
end

end
