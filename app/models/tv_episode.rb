class TvEpisode < ApplicationRecord
  belongs_to :tv_serie
  belongs_to :tv_season
end
