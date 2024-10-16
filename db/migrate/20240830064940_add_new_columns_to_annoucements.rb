# frozen_string_literal: true

class AddNewColumnsToAnnoucements < ActiveRecord::Migration[7.1]
  def change
    add_column :annoucements, :status, :integer, default: 1
  end
end
