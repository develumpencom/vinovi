class TvSeasonsController < ApplicationController
  before_action :set_tv_season, only: [ :show ]

  def show
  end

  private

  def set_tv_season
    @tv_season = TvSeason.includes(:tv_serie).where(tv_serie: { tmdb_id: params[:tv_series_id] }, season_number: params[:id]).first

    if !@tv_season
      @tv_season = TvSeason.cache(params[:tv_series_id], params[:id])
    end

    if @tv_season.episode_count != @tv_season.tv_episodes.count
      @tv_season = TvSeason.cache(params[:tv_series_id], params[:id])
    end
  end
end
