# frozen_string_literal: true

class CreateSteps < ActiveRecord::Migration[7.1]
  def change
    create_table :steps do |t|
      t.string :title
      t.references :card, null: false, foreign_key: true
      t.date :due_date

      t.timestamps
    end
  end
end
