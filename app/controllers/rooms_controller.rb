class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_filter :authenticate_user!, only: [:new,:create,:update,:edit,:destroy]
  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
    #@rooms = current_user.rooms if current_user.present?
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @pictures = @room.pictures
  end

  # GET /rooms/new
  def new
    @room = Room.new
    @amenities = Amenity.all
    @rules =  Rule.all
    @pictures = @room.pictures
  end

  # GET /rooms/1/edit
  def edit 
     authorize! :edit, @room
  end

  # POST /rooms
  # POST /rooms.json
  def create
    # @room =  Room.new(room_params)
    @room = current_user.rooms.build(room_params)
    respond_to do |format|
      if @room.save

        if params[:pictures]
        #===== The magic is here ;)
          params[:pictures].each { |image|
            @room.pictures.create(attachment: image)
          }
        end

        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    params[:room][:rule_ids] ||= []
    params[:room][:amenity_ids] ||= [] 
    respond_to do |format|
      if @room.update_attributes(room_params)


         if params[:pictures]
        #===== The magic is here ;)
          params[:pictures].each { |image|
            @room.pictures.create(attachment: image)
          }
        end



        format.html { redirect_to edit_room_path(@room), notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
    authorize! :edit, @room
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
     authorize! :edit, @room
  end


  def delpic
    @pic = Picture.find(params[:pid])
    @room = Room.find(params[:rid])
    @pic.destroy
    redirect_to edit_room_path(@room)
  end


  def upvote
    @room.upvote_from current_user
    redirect_to @room
  end

  def downvote
    @room.downvote_from current_user
    redirect_to @room
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
      @amenities = Amenity.all
      @rules =  Rule.all
      @pictures = @room.pictures
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:title,:description,:room_type,:bedrooms,:bathrooms,:roomrent,:rooms_forrent,:available_from,:minimumstay,:current_roommates,:prefred_gender,:prefred_age_from, :prefred_age_to,:prefred_occupation,:phonenumber_visibility,:user_id,:area_id,:rule_ids => [],:amenity_ids => [])
    end
end
