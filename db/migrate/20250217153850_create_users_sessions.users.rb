# This migration comes from users (originally 20250127010039)
class CreateUsersSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :users_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
