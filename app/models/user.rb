class User < ApplicationRecord
  validates :email,      presence: true, uniqueness: true
  validates :provider,   presence: true
  validates :uid,        presence: true, uniqueness: true
  validates :name,       presence: true
  validates :last_name,  presence: true
  validates :first_name, presence: true
  validates :badge,      presence: true, uniqueness: true
  validates :roles,      presence: true

  devise :timeoutable, :trackable, :omniauthable, omniauth_providers: [ :ccso ]

  def self.from_omniauth(auth)
    where(uid: auth.uid, provider: auth.provider).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.encrypted_password = Devise.friendly_token # Set dummy password otherwise Devise will complain about empty passwords.
      user.name = auth.info.name
      user.last_name = auth.info.last_name
      user.first_name = auth.info.first_name
      user.badge = auth.extra.raw_info.employeeid
      user.roles = auth.extra.raw_info.roles.join(",")
    end
  end
end
