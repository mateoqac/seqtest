class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :amount, null: false
      t.belongs_to :shopper, foreing_key: true, index: true
      t.belongs_to :merchant, foreing_key: true, index: true
      t.datetime :completed_at, null:true

      t.timestamps
    end
  end
end
