# frozen_string_literal: true

namespace :init do
  desc 'Onboard initial data'
  task load_data: :environment do
    shoppers_path = 'lib/import/shoppers.csv'
    merchants_path = 'lib/import/merchants.csv'
    orders_path = 'lib/import/orders.csv'
    files_path = [shoppers_path, merchants_path, orders_path]
    abort("Please place your CSV files in lib/import/ and run again.") unless files_path.all? { |file| File.exist?(file)}

    ## load_shoppers
    multi_insert = []
    i = 1
    CSV.foreach(shoppers_path) do |row|
      params = {
        id: i,
        name: row[0],
        email: row[1],
        nif: row[2],
        created_at: Time.current,
        updated_at: Time.current
      }
      i += 1
      multi_insert << params
    end

    Shopper.insert_all(multi_insert)

    ## load_merchants
    multi_insert = []

    CSV.foreach(merchants_path) do |row|
      params = {
        id: row[0],
        name: row[1],
        email: row[2],
        cif: row[3],
        created_at: Time.current,
        updated_at: Time.current
      }
      i += 1
      multi_insert << params
    end

    Merchant.insert_all(multi_insert)

    ## load_orders
    multi_insert = []

    CSV.foreach(orders_path) do |row|
      params = {
        id: row[0],
        merchant_id: row[1],
        shopper_id: row[2],
        amount: row[3],
        created_at: row[4],
        completed_at: row[5] || nil,
        updated_at: Time.current
      }
      i += 1
      multi_insert << params
    end

    Order.insert_all(multi_insert)
  end
end
