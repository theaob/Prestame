Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'KEY', 'SECRET'
  provider :facebook, 'KEY', 'SECRET', {:client_options => {:ssl => {:ca_path => "#{Rails.root}/config/ca-bundle.crt"}}}
end