class AddFieldsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :upvote, :integer
    add_column :posts, :user_id, :integer
  end
end
