json.array!(@authentications) do |authentication|
  json.extract! authentication, :id, :user, :provider, :uid
  json.url authentication_url(authentication, format: :json)
end
