class SearchController < ApplicationController
  allow_unauthenticated_access

  def show
    @query = params[:query]
    @results = Tmdb.search(@query)
  end
end
