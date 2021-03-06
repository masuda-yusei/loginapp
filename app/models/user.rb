class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name, presence: true, length: { maximum:30 }
  validates :email, presence: true, length: { maximum: 200 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_many :blogs
  has_many :favorites, dependent: :destroy
  has_many :favorite_blogs, through: :favorites, source: :blog
end
