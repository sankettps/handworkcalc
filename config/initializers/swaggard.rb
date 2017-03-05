Swaggard.configure do |config|
  config.api_version = '0.1'
	config.authentication_type  = 'header'
	config.authentication_key   = 'Authorization' # Defaults to 'api_key'
	config.default_content_type = 'application/json'
	config.controllers_path = "#{Rails.root}/app/controllers/api/v1/**/*.rb"
end