class MoviesController < ApplicationController
  allow_unauthenticated_access

  def show
    @movie = Movie.find_or_create_by(tmdb_id: params[:id]) do |movie|
      tmdb_movie = Tmdb.movie(params[:id])

      movie.imdb_id = tmdb_movie["imdb_id"]
      movie.title = tmdb_movie["title"]
      movie.release_year = tmdb_movie["release_date"]&.split("-")&.first&.to_i
      movie.runtime = tmdb_movie["runtime"]
      movie.poster_path = tmdb_movie["poster_path"]
      movie.overview = tmdb_movie["overview"]
    end
  end
end
