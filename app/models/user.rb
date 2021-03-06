class User < ApplicationRecord
  devise :omniauthable, omniauth_providers: [:twitter]

  def self.from_omniauth(auth)
    find_or_create_by!(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid      = auth["uid"]
      user.token    = auth["credentials"]["token"]
      user.secret   = auth["credentials"]["secret"] 
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new( session["devise.user_attributes"] ) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end
