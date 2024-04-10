class User < ApplicationRecord
  devise  :timeoutable,
          # :database_authenticatable,
          # :lockable,
          :trackable,
          :omniauthable,
          # :rememberable,
          # :validatable,
          omniauth_providers: [:microsoft]

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
    end
  end
end
