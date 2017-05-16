class TweeterSerializer < ActiveModel::Serializer
  attributes :id, :name, :screen_name, :description
end
