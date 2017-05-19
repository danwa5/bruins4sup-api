class AddProfileImageUrlToTweeters < ActiveRecord::Migration[5.0]
  def change
    add_column :tweeters, :profile_image_url, :string
  end
end
