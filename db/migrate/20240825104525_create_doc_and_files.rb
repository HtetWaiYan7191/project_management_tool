# frozen_string_literal: true

class CreateDocAndFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :doc_and_files do |t|
      t.references :company, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
