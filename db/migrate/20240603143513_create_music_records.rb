# frozen_string_literal: true

class CreateMusicRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :music_records do |t|
      t.string :title, null: false
      t.string :photo, null: false
      t.integer :price, null: false
      t.string :currency, null: false
      t.text :description, null: false, unique: true
      t.integer :damage_assessment

      t.timestamps
    end
  end
end
