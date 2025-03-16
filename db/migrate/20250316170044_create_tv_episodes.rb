class CreateTvEpisodes < ActiveRecord::Migration[8.0]
  def change
    create_table :tv_episodes do |t|
      t.string :tmdb_id, null: false
      t.references :tv_serie, null: false, foreign_key: true
      t.references :tv_season, null: false, foreign_key: true
      t.string :name
      t.string :still_path
      t.integer :episode_number
      t.string :air_date

      t.timestamps
    end
  end
end
