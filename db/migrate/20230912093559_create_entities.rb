# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :group, null: false, foreign_key: { to_table: :groups }
      t.string :name
      t.decimal :amount
      t.datetime :created_at
    end
  end
end
