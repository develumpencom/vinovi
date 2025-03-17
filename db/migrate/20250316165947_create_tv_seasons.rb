class CreateTvSeasons < ActiveRecord::Migration[8.0]
  def change
    create_table :tv_seasons do |t|
      t.references :tv_serie, null: false, foreign_key: true
      t.string :tmdb_id, null: false
      t.string :name
      t.text :overview
      t.string :poster_path
      t.integer :season_number
      t.string :air_date
      t.integer :episode_count

      t.timestamps
    end
  end
end
