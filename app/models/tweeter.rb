class Tweeter < ApplicationRecord
  validates_presence_of :uid, :screen_name, :name
  validates_uniqueness_of :uid, :screen_name
end
