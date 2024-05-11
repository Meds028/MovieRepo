class MovieController < ApplicationController
  def new
    @bookmarked = Bookmark.find_by(user_id: session[:user_id], movie: params[:params])
    @response = JSON.parse(HTTParty.get("https://yts.mx/api/v2/movie_details.json?movie_id=#{params[:params]}&with_images=true&with_cast=true").body)
    @movies = @response["data"]["movie"]

    @similar_response = JSON.parse(HTTParty.get("https://yts.mx/api/v2/movie_suggestions.json?movie_id=#{params[:params]}").body)
    @similar_movies = @similar_response["data"]["movies"]
  end
end
