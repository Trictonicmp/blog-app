class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: 'user' }
      t.references :post, null:false, foreign_key: { to_table: 'posts' }
      t.string :text

      t.timestamps
    end
  end
end
