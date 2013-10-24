Rails.application.config.middleware.use OmniAuth::Builder do
	provider :twitter,
		Settings.OmniAuth.twitter.consumer_key,
		Settings.OmniAuth.twitter.consumer_secret,
		display: 'popup'
	
	provider :facebook,
		Settings.OmniAuth.facebook.app_id,
		Settings.OmniAuth.facebook.app_secret,
		display: 'popup'
	provider :yahoojp,
		Settings.OmniAuth.yahoojp.app_id,
		Settings.OmniAuth.yahoojp.app_secret,
		{
		      scope: "openid profile"
		}
	provider :google_oauth2,
		Settings.OmniAuth.google.client_id,
		Settings.OmniAuth.google.client_secret,
		{
			name: "google",
			scope: "userinfo.profile",
			approval_prompt: 'auto'
		}
	provider :mixi,
		Settings.OmniAuth.mixi.consumer_key,
		Settings.OmniAuth.mixi.consumer_secret,
		info_level: :min
end

