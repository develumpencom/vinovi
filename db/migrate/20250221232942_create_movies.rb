class CreateMovies < ActiveRecord::Migration[8.0]
  def change
    create_table :movies do |t|
      t.string :tmdb_id, null: false
      t.string :imdb_id
      t.string :title, null: false
      t.string :release_year
      t.integer :runtime
      t.string :poster_path
      t.string :overview

      t.timestamps
    end
  end
end
