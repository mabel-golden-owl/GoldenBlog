class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true
end
