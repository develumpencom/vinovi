class TvSeriesController < ApplicationController
  allow_unauthenticated_access

  before_action :set_tv_serie, only: [ :show ]

  def show
  end

  private

  def set_tv_serie
    @tv_serie = TvSerie.find_or_cache_by_tmdb_id(tmdb_id: params[:id])
  end
end
