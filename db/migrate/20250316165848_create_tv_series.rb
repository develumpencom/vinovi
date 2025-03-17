class CreateTvSeries < ActiveRecord::Migration[8.0]
  def change
    create_table :tv_series do |t|
      t.string :tmdb_id, null: false
      t.string :name, null: false
      t.text :overview
      t.string :poster_path
      t.string :first_air_date
      t.integer :number_of_seasons, null: false

      t.timestamps
    end
  end
end
