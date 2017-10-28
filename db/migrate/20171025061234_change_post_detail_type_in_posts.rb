class ChangePostDetailTypeInPosts < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :post_detail, :text
  end
end
