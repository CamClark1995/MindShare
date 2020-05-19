class ChangeTweetName < ActiveRecord::Migration[6.0]
  def up
  	rename_table :tweets, :posts
  end
  def down
  	rename_table :posts, :tweets
  end
end
