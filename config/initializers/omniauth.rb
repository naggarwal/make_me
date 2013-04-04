Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '111953692166143', '260070d5ce1c26aa36cd8b81dd3ff351'
  provider :twitter, 'PntkYJL1BveIORoZEd3Qw', 'ih0zqsDsfJxpZ7Xc0zwwjUoWA9GhkfnGizEndi9JCA'
end