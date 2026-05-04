class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    @movies = Movie.order(sort_column => sort_direction)
  end

  # GET /movies/1 or /movies/1.json
  def show
    @movie = Movie.includes(roles: :person).find(params[:id])
    @review = @movie.reviews.build
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    @movie.roles.build
  end

  # GET /movies/1/edit
  def edit
    @movie.roles.build
  end

  # POST /movies or /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to root_path, notice: "Movie was successfully created." }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy!

    respond_to do |format|
      format.html { redirect_to movies_path, notice: "Movie was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  # POST /movies/search_tmdb
  def search_tmdb
    query = params[:search_terms].to_s.strip
    if query.blank?
      redirect_to root_path, notice: "Please enter a search term"
      return
    end
    api_key = ENV["TMDB_API_KEY"].to_s.strip
    @tmdb_results = []

    begin
      service = TmdbService.new(api_key)
      @tmdb_results = service.search(query)
    rescue StandardError => e
      Rails.logger.error("TMDb search failed: #{e.class} - #{e.message}")
      @tmdb_results = []
    end

    if @tmdb_results.empty?
      redirect_to root_path, notice: "'#{query}' was not found in TMDb"
    else
      render :search_results
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(
        :title, :synopsis, :release_date, :age_rating, :duration_minutes, :poster_url,
        roles_attributes: [:id, :person_name, :role_type, :character_name, :_destroy]
      )
    end

    def sort_column
      %w[title age_rating duration_minutes].include?(params[:sort]) ? params[:sort] : 'title'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end
end
