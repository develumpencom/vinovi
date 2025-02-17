class Tmdb
  def self.movie(id)
    response = connection.get("movie/#{id}")
    JSON.parse(response.body)
  end

  def self.person(id)
    response = connection.get("person/#{id}")
    JSON.parse(response.body)
  end

  def self.search(query)
    response = connection.get("search/multi", { query: query })
    JSON.parse(response.body)
  end

  def self.tv(id)
    response = connection.get("tv/#{id}")
    JSON.parse(response.body)
  end

  private

  def self.connection
    Faraday.new("https://api.themoviedb.org/3") do |faraday|
      faraday.params = { api_key: Rails.application.credentials.dig(:tmdb, :api_key) }
    end
  end
end
