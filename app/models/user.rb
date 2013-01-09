class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    #this tries to find user with provider and user ide, takes first or initilizes new record - tap passes it to block
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.image = auth.info.image
      user.gender = auth.extra.raw_info.gender
      user.save!
    end
  end
end
