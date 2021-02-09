# frozen_string_literal: true

class CreateMerchants < ActiveRecord::Migration[6.0]
  def change
    create_table :merchants do |t|
      t.string :name, null: false
      t.string :email, unique:true, null: false
      t.string :cif, unique:true, null: false

      t.timestamps
    end
  end
end
