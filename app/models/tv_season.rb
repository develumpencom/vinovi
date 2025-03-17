class TvSeason < ApplicationRecord
  belongs_to :tv_serie
  has_many :tv_episodes

  def self.cache(tv_serie_tmdb_id, season_number)
    @tmdb_tv_season = Tmdb.tv_season(tv_serie_tmdb_id, season_number)
    @tv_serie = TvSerie.find_or_cache_by_tmdb_id(tmdb_id: tv_serie_tmdb_id)
    @tv_season = @tv_serie.tv_seasons.find_by(season_number:)

    tv_season_attributes = {
      tmdb_id: @tmdb_tv_season["id"],
      tv_serie_id: @tv_serie.id,
      poster_path: @tmdb_tv_season["poster_path"],
      season_number: @tmdb_tv_season["season_number"],
      air_date: @tmdb_tv_season["air_date"],
      episode_count: @tmdb_tv_season["episodes"].count
    }

    @tv_season.episode_count != @tv_season.tv_episodes.count ?
      TvSeason.cache_episodes(@tv_serie.id, @tv_season.id, @tmdb_tv_season["episodes"]) :
      @tv_season.update!(tv_season_attributes)

    @tv_season
  end

  def self.cache_episodes(tv_serie_id, tv_season_id, episodes)
    episodes.each do |episode|
      TvEpisode.find_or_create_by!(tmdb_id: episode["id"]) do |tv_episode|
        tv_episode.tv_serie_id = tv_serie_id
        tv_episode.tv_season_id = tv_season_id
        tv_episode.name = episode["name"]
        tv_episode.still_path = episode["still_path"]
        tv_episode.episode_number = episode["episode_number"]
        tv_episode.air_date = episode["air_date"]
      end
    end
  end
end
