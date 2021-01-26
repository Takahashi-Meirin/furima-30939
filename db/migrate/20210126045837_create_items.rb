class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # 名前のカラムを作成
      t.string :name,         null: false
      # 紹介文のカラムを作成
      t.text   :introduction, null: false
      # 値段のカラムを作成
      t.integer :price,       null: false
      # カテゴリーのカラムを作成
      t.integer :category_id, null:false
      # 状態のカラムを作成
      t.integer :condition_id, null:false


      t.timestamps
    end
  end
end
