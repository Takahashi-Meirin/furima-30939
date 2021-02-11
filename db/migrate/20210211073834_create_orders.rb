class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      # 値段のカラムを作成
      t.integer :price ,null:false

      t.timestamps
    end
  end
end
