class BackgroundSerializer
  include JSONAPI::Serializer
  attributes :description, :url, :name, :owner_page
end
