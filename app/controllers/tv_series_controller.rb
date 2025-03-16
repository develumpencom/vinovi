class TvSeriesController < ApplicationController
  allow_unauthenticated_access

  before_action :set_tv_serie, only: [ :show ]

  def show
  end

  private

  def set_tv_serie
    @tv_serie = TvSerie.find_by(tmdb_id: params[:id]) || TvSerie.cache(tmdb_id: params[:id])
  end
end
