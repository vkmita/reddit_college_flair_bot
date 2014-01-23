Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, 'typJ0PylH2pkVw', 'ZBHcC-dJYhIqRm74HpCU6m5AHE8', :scope => 'identity,modflair'
end