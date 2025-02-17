class TvSeriesController < ApplicationController
  allow_unauthenticated_access

  def show
    @tv = Tmdb.tv(params[:id])
  end
end
