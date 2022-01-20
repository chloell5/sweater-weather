class UserSerializer
  include JSONAPI::Serializer

  set_type :users

  attribute :email

  attribute :api_key do |object|
    object.api_keys.first.token.to_s
  end
end
