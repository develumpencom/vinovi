class WatchedController < ApplicationController
  before_action :set_media, only: [ :new, :create ]

  def new
    @watched = Current.user.watched.new(watched_at: Time.now, media: @media)
  end

  def create
    @watched = Current.user.watched.new(watched_params.merge(media: @media))

    if @watched.save
      redirect_to @media, notice: "You have watched this!"
    else
      flash[:alert] = "Something went wrong"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_media
    if params[:movie_id]
      @media = Movie.find_by(tmdb_id: params[:movie_id])
    end
  end

  def watched_params
    params.expect(watched: [ :watched_at ])
  end
end
