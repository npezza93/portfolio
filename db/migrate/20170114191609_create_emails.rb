# frozen_string_literal: true

class CreateEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :emails do |t|
      t.string :name
      t.string :email
      t.text :message

      t.timestamps
    end
  end
end