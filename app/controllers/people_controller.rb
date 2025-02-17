class PeopleController < ApplicationController
  allow_unauthenticated_access

  def show
    @person = Tmdb.person(params[:id])
  end
end
