class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      # 配送先郵便番号のカラムを作成
      t.string :post_code,      null: false
      # 再送先市区町村のカラムを作成
      t.string   :municipality, null: false
      # 配送先番地のカラムを作成
      t.string :address,        null: false
      # 配送先建物のカラムを作成
      t.string :building
      # 配送先電話番号のカラムを作成
      t.string :phone_number,   null: false
      # 配送先の地域のカラムを作成
      t.integer :prefecture_id, null: false
      # history_idカラムを外部キー制約でつける
      t.integer :history_id,    null: false

      t.timestamps
    end
  end
end
