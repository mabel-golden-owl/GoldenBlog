class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  validates :title, :content, :image, presence: true

  scope :approved, -> {where(status: 'Approved')}
end
