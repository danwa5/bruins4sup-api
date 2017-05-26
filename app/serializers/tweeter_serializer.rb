class TweeterSerializer < ActiveModel::Serializer
  attributes :id, :uid, :name, :screen_name, :description, :profile_image_url
end
