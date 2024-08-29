# frozen_string_literal: true

class AddNewColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :position, :string
    add_reference :users, :company, foreign_key: true, index: true, null: false
    add_reference :users, :department, foreign_key: true, index: true, null: false
  end
end
