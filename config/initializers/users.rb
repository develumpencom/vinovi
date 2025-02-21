Users.configure do |config|
  config.oauth_server_url = "https://breakabletoys.com"
  config.breakable_toys_client_id = Rails.application.credentials.dig(:breakable_toys, :client_id)
  config.breakable_toys_client_secret = Rails.application.credentials.dig(:breakable_toys, :client_secret)
  config.disable_form_access = true
end
