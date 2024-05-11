class BrowseController < ApplicationController
  def new
    @response = JSON.parse(HTTParty.get("https://yts.mx/api/v2/list_movies.json?limit=20?page1").body)
    @movies = @response["data"]["movies"]
  end

  def filter
    if(params[:term] == "_")
      params[:term] = ""
    end
    if(params[:order_by] == "oldest")
      params[:order_by] = "date_added&order_by=asc"
    end
    if(params[:order_by] == "alphabetical")
      params[:order_by] = "title"
    end
    if(params[:order_by] == "popular")
      params[:order_by] = "like_count"
    end
    @response = JSON.parse(HTTParty.get("https://yts.mx/api/v2/list_movies.json?quality=#{params[:quality]}&genre=#{params[:genre]}&minimum_rating=#{params[:rating]}&sort_by=#{params[:order_by]}&query_term=#{params[:term]}&limit=20&page=#{params[:page]}").body)
    @movies = @response["data"]["movies"]
    render :new
  end

  def bookmark
    @bookmarks = Bookmark.where(user_id: session[:user_id])
  end

  def bookmarked
    bookmarked = Bookmark.find_by(user_id: session[:user_id], movie: params[:params])

    if bookmarked
      bookmarked.destroy
      flash[:notice] = "Bookmark has been removed"
    else
      bookmark = Bookmark.new(user_id: session[:user_id], movie: params[:params])
      if bookmark.save
        flash[:notice] = "Movie is now bookmarked"
      else
        flash[:alert] = "Failed to add in bookmark"
        Rails.logger.error("Failed to save bookmark: #{bookmark.errors.full_messages.join(', ')}")
      end
    end
  
    redirect_to movie_path(params[:params], params[:title].parameterize)
  end

  def bookmarked_list
    bookmarked = Bookmark.find_by(user_id: session[:user_id], movie: params[:id])
    
    if bookmarked
      bookmarked.destroy
    end
  
    redirect_to bookmark_path
  end
  
  
end
