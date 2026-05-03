class TmdbService
  TMDB_SEARCH_URL = "https://api.themoviedb.org/3/search/movie"

  def initialize(api_key, timeout: 5)
    @api_key = api_key.to_s
    @timeout = timeout
  end

  # Returns an array of result hashes or [] on non-success
  def search(query)
    return [] if @api_key.empty? || query.to_s.strip.empty?

    require 'net/http'
    require 'uri'
    require 'json'

    uri = URI(TMDB_SEARCH_URL)
    uri.query = URI.encode_www_form(api_key: @api_key, query: query)

    res = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https', open_timeout: @timeout, read_timeout: @timeout) do |http|
      http.get(uri.request_uri)
    end

    return [] unless res.is_a?(Net::HTTPSuccess)

    body = JSON.parse(res.body)
    body['results'] || []
  end
end
