class HomeController < ApplicationController
	 layout "home", only: [:index]
	 layout "application", except: [:index]
  def index
  	
  end


  def listings
  	@rooms = Room.all
  end

  def listing
  	@room = Room.find_by_id(params[:id])
  	@pictures = @room.pictures
  end


   def upvote
    @room = Room.find_by_id(params[:id])
    @room.upvote_from current_user
    redirect_to listing_path(:id => @room.id)
  end

  def downvote
    @room = Room.find_by_id(params[:id])
    @room.downvote_from current_user
    redirect_to listing_path(:id => @room.id)
  end
 
end
