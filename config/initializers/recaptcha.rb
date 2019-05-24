Recaptcha.configure do |config|
	config.recaptcha_site_key   = Rails.application.secrets[:RECAPTCHA_SITE_KEY]
	config.recaptcha_secret_key = Rails.application.secrets[:RECAPTCHA_PRIVATE_KEY]
end