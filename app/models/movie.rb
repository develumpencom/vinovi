class Movie < ApplicationRecord
  def poster_url
    "https://image.tmdb.org/t/p/w185#{poster_path}" if poster_path.present?
  end

  def to_param
    tmdb_id
  end

  def self.find(id)
    find_by(tmdb_id: id)
  end
end
