class HomeController < ApplicationController
  def new
    top_response = JSON.parse(HTTParty.get("https://yts.mx/api/v2/list_movies.json?sort_by=like_count&limit=4").body)
    @top_movies = top_response["data"]["movies"]

    new_upload_response = JSON.parse(HTTParty.get("https://yts.mx/api/v2/list_movies.json?sort_by=date_added&limit=4").body)
    @new_upload = new_upload_response["data"]["movies"]

    rating_response = JSON.parse(HTTParty.get("https://yts.mx/api/v2/list_movies.json?sort_by=rating&limit=4").body)
    @top_rating = rating_response["data"]["movies"]
  end

end
