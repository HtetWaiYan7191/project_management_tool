# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.references :company, null: false, foreign_key: true
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.string :location

      t.timestamps
    end
  end
end
