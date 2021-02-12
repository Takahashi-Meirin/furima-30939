class CreateHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :histories do |t|
      # user_idカラムを外部キー制約でつける
      t.integer :user_id,    null: false, foreign_key: true
      # item_idカラムを外部キー制約でつける
      t.integer :item_id,    null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
