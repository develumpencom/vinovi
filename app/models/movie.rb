class Movie < ApplicationRecord
  def poster_url
    "https://image.tmdb.org/t/p/w185#{poster_path}" if poster_path.present?
  end
end
