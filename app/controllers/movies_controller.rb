class MoviesController < ApplicationController
  allow_unauthenticated_access

  def show
    @movie = Tmdb.movie(params[:id])
  end
end
