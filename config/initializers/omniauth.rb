OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  begin
    require_relative "env_vars.rb"
    ENV['FACEBOOK_API_ID'] = facebook_api_id
    ENV['FACEBOOK_API_SECRET'] = facebook_api_secret
  rescue LoadError
    # do nothing
  end
  provider :facebook, ENV['FACEBOOK_API_ID'], ENV['FACEBOOK_API_SECRET']
end