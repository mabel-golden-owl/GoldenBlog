class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  mount_uploader :avatar, AvatarUploader
  validates :first_name, presence: true
  validates :last_name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook]

#   def self.new_with_session(params, session)
#     super.tap do |user|
#       if data = session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
#         user.email = data['email'] if user.email.blank?
#       end
#     end
#  end

  def self.find_for_facebook_oauth(auth, _signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user
      user
    else
      registered_user = User.where(email: auth.info.email).first

      return registered_user if registered_user

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
  end

end
