class TvSerie < ApplicationRecord
  has_many :tv_seasons, dependent: :destroy
  has_many :tv_episodes, dependent: :destroy

  def self.cache(tmdb_id:)
    @tmdb_tv = Tmdb.tv(tmdb_id)
    @tv_serie = TvSerie.find_by(tmdb_id: tmdb_id)

    attributes = {
      tmdb_id: @tmdb_tv["id"],
      name: @tmdb_tv["name"],
      overview: @tmdb_tv["overview"],
      poster_path: @tmdb_tv["poster_path"],
      first_air_date: @tmdb_tv["first_air_date"],
      number_of_seasons: @tmdb_tv["number_of_seasons"]
    }

    @tv_serie = @tv_serie ? @tv_serie.update!(attributes) : TvSerie.create!(attributes)

    if @tv_serie.previously_new_record?
      @tmdb_tv["seasons"].each do |season|
        TvSeason.cache(tmdb_tv_series_id: @tv_serie.tmdb_id, season_number: season["season_number"])
      end
    end

    @tv_serie
  end
end
