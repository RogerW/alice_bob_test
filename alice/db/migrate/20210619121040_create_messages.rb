# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.string :txt
      t.datetime :sended_at
      t.datetime :received_at
      t.datetime :repeated_at
      t.integer :status

      t.timestamps
    end
  end
end
