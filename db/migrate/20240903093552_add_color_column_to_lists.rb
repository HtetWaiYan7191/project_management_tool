# frozen_string_literal: true

class AddColorColumnToLists < ActiveRecord::Migration[7.1]
  def change
    add_column :lists, :color, :string
  end
end
