# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :department, null: false, foreign_key: true
      t.text :content
      t.references :parent_message, foreign_key: { to_table: :messages }, null: true

      t.timestamps
    end
  end
end
