class TweeterSerializer < ActiveModel::Serializer
  attributes :id, :name, :screen_name, :description, :profile_image_url
end
