class WatchedController < ApplicationController
  before_action :set_media, only: [ :new, :create ]
  before_action :set_watched, only: [ :show, :destroy ]

  def show
  end

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

  def destroy
    @watched.destroy

    redirect_to @watched.media, notice: "You have unwatched this!"
  end

  private

  def set_media
    if params[:movie_id]
      @media = Movie.find_by(tmdb_id: params[:movie_id])
    end
  end

  def set_watched
    @watched ||= Current.user.watched.includes(media: [ :movie ]).find(params[:id])
  end

  def watched_params
    params.expect(watched: [ :watched_at ])
  end
end
