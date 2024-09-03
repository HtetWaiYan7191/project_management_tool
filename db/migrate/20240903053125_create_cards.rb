# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :title
      t.references :list, null: false, foreign_key: true
      t.integer :position
      t.date :due_date

      t.timestamps
    end
  end
end
