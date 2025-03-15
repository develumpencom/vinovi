class TvSeasonsController < ApplicationController
  def show
    @tv = Tmdb.tv(params[:tv_series_id])
    @tv_season = Tmdb.tv_season(params[:tv_series_id], params[:id])
  end
end
