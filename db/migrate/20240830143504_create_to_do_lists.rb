# frozen_string_literal: true

class CreateToDoLists < ActiveRecord::Migration[7.1]
  def change
    create_table :to_do_lists do |t|
      t.references :to_do, null: false, foreign_key: true
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.date :due_date
      t.string :note
      t.boolean :status, default: false
      t.timestamps
    end
  end
end
