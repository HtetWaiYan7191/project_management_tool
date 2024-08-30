class CreateToDos < ActiveRecord::Migration[7.1]
  def change
    create_table :to_dos do |t|
      t.string :name
      t.references :company, null: false, foreign_key: true
      t.boolean :status, default: :false
      t.timestamps
    end
  end
end
