Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'Xwthd5fZ5GO07RskF3Tg', 'isgQO4BPRqR3eVP1AIdeQXYQm3GkZTDkEneIOGA22I4'
  provider :facebook, '353419201365425', 'de81aaf26304be9f84021ed99e38582f', {:client_options => {:ssl => {:ca_path => "#{Rails.root}/config/ca-bundle.crt"}}}
end