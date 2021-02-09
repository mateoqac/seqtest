# frozen_string_literal: true

class CreateShoppers < ActiveRecord::Migration[6.0]
  def change
    create_table :shoppers do |t|
      t.string :name, null: false
      t.string :email, unique:true, null: false
      t.string :nif, unique:true, null: false

      t.timestamps
    end
  end
end
