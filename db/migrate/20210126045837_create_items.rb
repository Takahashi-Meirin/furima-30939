class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      # 商品名のカラムを作成
      t.string :name,         null: false
      # 商品の紹介文のカラムを作成
      t.text   :introduction, null: false
      # 商品の値段のカラムを作成
      t.integer :price,       null: false

      t.timestamps
    end
  end
end
