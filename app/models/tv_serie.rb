class TvSerie < ApplicationRecord
  has_many :tv_seasons, dependent: :destroy
  has_many :tv_episodes, dependent: :destroy

  def self.find_or_cache_by_tmdb_id(tmdb_id:)
    TvSerie.find_by(tmdb_id:) || TvSerie.cache(tmdb_id:)
  end

  def self.cache(tmdb_id:)
    @tmdb_tv = Tmdb.tv(tmdb_id)
    @tv_serie = TvSerie.find_by(tmdb_id: tmdb_id)

    tv_serie_attributes = {
      tmdb_id: @tmdb_tv["id"],
      name: @tmdb_tv["name"],
      overview: @tmdb_tv["overview"],
      poster_path: @tmdb_tv["poster_path"],
      first_air_date: @tmdb_tv["first_air_date"],
      number_of_seasons: @tmdb_tv["number_of_seasons"]
    }

    @tv_serie ? @tv_serie.update!(attributes)
              : TvSerie.create_with_seasons(tv_serie_attributes, @tmdb_tv["seasons"])
  end

  def self.create_with_seasons(tv_serie_attributes, seasons)
    @tv_serie = TvSerie.create!(tv_serie_attributes)

    seasons.each do |season|
      @tv_serie.tv_seasons.create!(
        tmdb_id: season["id"],
        name: season["name"],
        overview: season["overview"],
        poster_path: season["poster_path"],
        season_number: season["season_number"],
        air_date: season["air_date"],
        episode_count: season["episode_count"]
      )
    end

    @tv_serie
  end
end
