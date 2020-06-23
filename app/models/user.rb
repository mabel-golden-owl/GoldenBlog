class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  mount_uploader :avatar, AvatarUploader
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :avatar, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

end
