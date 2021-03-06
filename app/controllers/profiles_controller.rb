class ProfilesController < ApplicationController
	before_filter :authenticate_user!
 layout 'profile'
	def edit
		@profile = current_user.profile 
	end

	def update
		 @profile = Profile.find(params[:id])
		 @profile.update_attributes(profile_params)
		 
		 redirect_to user_profile_path    
	end

	def delprofilepic
		@profile = Profile.find(params[:id])
		@profile.picture.destroy
		redirect_to user_profile_path  
	end

	def uploadprofilepic
		@profile = current_user.profile
		@profile.picture.save
		render :text => 'wow'
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:first_name,:last_name,:phone_no,:gender,:dob,:address,:occupation,:myself,:user_id,:picture)
    end
end
