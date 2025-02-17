class Tmdb
  def self.search(query)
    response = connection.get("search/multi", { query: query })
    JSON.parse(response.body)
  end

  private

  def self.connection
    Faraday.new("https://api.themoviedb.org/3") do |faraday|
      faraday.params = { api_key: Rails.application.credentials.dig(:tmdb, :api_key) }
    end
  end
end
