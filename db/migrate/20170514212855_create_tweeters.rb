class CreateTweeters < ActiveRecord::Migration[5.0]
  def change
    create_table :tweeters do |t|
      t.string :uid
      t.string :name
      t.string :screen_name
      t.string :description

      t.timestamps
    end
  end
end
