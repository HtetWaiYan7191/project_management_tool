# frozen_string_literal: true

class CreateDepartments < ActiveRecord::Migration[7.1]
  def change
    create_table :departments do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
