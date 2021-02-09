# frozen_string_literal: true

class CreateDisbursements < ActiveRecord::Migration[6.0]
  def change
    create_table :disbursements do |t|
      t.float :amount, null: false
      t.float :earnings, null: false
      t.belongs_to :merchant, foreing_key: true, index: true
      t.integer :week_of_year, null: false
      t.integer :year, null: false

      t.timestamps
    end
  end
end
