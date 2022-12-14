class AddDefaultValues < ActiveRecord::Migration[7.0]
  def up
    change_column_default :users, :post_counter, 0
    change_column_default :posts, :comments_counter, 0
    change_column_default :posts, :likes_counter, 0
  end

  def down
    change_column_default :users, :post_counter, nil
    change_column_default :posts, :comments_counter, nil
    change_column_default :posts, :likes_counter, nil
  end
end
