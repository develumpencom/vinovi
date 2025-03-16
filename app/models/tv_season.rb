class TvSeason < ApplicationRecord
  belongs_to :tv_serie

  def self.cache(tmdb_tv_series_id:, season_number:)
    @tmdb_tv_season = Tmdb.tv_season(tmdb_tv_series_id, season_number)
    @tv_serie = TvSerie.find_by(tmdb_id: tmdb_tv_series_id)
    @tv_season = @tv_serie.tv_seasons.find_by(season_number:)

    attributes = {
      tmdb_id: @tmdb_tv_season["id"],
      tv_serie_id: tmdb_tv_series_id,
      poster_path: @tmdb_tv_season["poster_path"],
      season_number: @tmdb_tv_season["season_number"],
      air_date: @tmdb_tv_season["air_date"],
      episode_count: @tmdb_tv_season["episodes"].count
    }

    @tv_season ? @tv_season.update!(attributes) : @tv_serie.tv_seasons.create!(attributes)
  end
end
