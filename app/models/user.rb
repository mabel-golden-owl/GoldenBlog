class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :rate_posts, through: :rates

  mount_uploader :avatar, AvatarUploader
  validates :first_name, :last_name, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_facebook_oauth(auth, _signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).or(User.where(email: auth.info.email)).first

    return user if user.present?

    user = User.new(
      name: auth.extra.raw_info.name,
      provider: auth.provider,
      uid: auth.uid,
      email: auth.info.email,
      password: Devise.friendly_token[0, 20],
      image: auth.info.image,
      first_name: auth.extra.raw_info.name.split.first,
      last_name: auth.extra.raw_info.name.split.last
    )
    user.skip_confirmation!
    user.save
    user
  end

  def admin?
    role == 'admin'
  end
end
