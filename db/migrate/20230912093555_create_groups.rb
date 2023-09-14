# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.date :created_at
      t.references :user, null: false, foreign_key: true
    end
  end
end
