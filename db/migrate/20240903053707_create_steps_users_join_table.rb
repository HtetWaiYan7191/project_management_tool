# frozen_string_literal: true

class CreateStepsUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :steps, :users do |t|
      t.index :step_id
      t.index :user_id
    end
  end
end
