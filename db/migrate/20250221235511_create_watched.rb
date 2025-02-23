class CreateWatched < ActiveRecord::Migration[8.0]
  def change
    create_table :watched do |t|
      t.references :user, null: false, foreign_key: true
      t.references :media, polymorphic: true, null: false
      t.datetime :watched_at, null: false

      t.timestamps
    end
  end
end
