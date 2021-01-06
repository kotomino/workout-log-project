class User < ActiveRecord::Base
  has_many :workouts
  has_secure_password

  validates :email, presence: true, uniqueness: true
end
