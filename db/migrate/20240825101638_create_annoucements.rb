# frozen_string_literal: true

class CreateAnnoucements < ActiveRecord::Migration[7.1]
  def change
    create_table :annoucements do |t|
      t.references :user, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.string :title
      t.boolean :is_all_department, default: false

      t.timestamps
    end
  end
end
