# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :music_record, null: false, foreign_key: true
      t.string :note
      t.integer :initial_price, null: false
      t.integer :initial_damage_assessment, null: false
      t.timestamps
    end
    add_index :orders, %i[user_id music_record_id], unique: true
  end
end
