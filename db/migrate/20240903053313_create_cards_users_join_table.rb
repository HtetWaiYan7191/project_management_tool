# frozen_string_literal: true

class CreateCardsUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_join_table :cards, :users do |t|
      t.index :card_id
      t.index :user_id
    end
  end
end
