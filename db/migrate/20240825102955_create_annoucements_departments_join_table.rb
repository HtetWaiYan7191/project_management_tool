# frozen_string_literal: true

class CreateAnnoucementsDepartmentsJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :annoucements, :departments do |t|
      t.index :annoucement_id
      t.index :department_id
    end
  end
end
