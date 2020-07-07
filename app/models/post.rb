class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader
  validates :title, :content, :image, presence: true

  scope :approved, -> { where(status: 'Approved') }

  def self.search(search)
    category_id = Category.find_by('lower(name) = ?', search.downcase)
    @posts = Post.approved
    @posts = if category_id.present?
               @posts.where(category_id: category_id)
             else
               @posts.where('title LIKE ?', "%#{search}%")
             end
  end
end
