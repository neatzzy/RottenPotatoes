json.extract! movie, :id, :title, :synopsis, :release_date, :duration_minutes, :poster_url, :created_at, :updated_at
json.url movie_url(movie, format: :json)
