class SearchTalentsController < ApplicationController
	#make sure the user is logged in
	before_action :authenticate_user!, :get_user
	# Stops current student users and non verified companies from accessing all actions except index and search
	before_action :allowed_user

	def new
		@search_talent  = SearchTalent.new
	end

	def create
	@search_talent = SearchTalent.create!(search_talent_params)
	# (params[:search_params])
	redirect_to @search_talent
	end

	def show
	    @student_profiles = StudentProfile.where(params[:search_talent])
		@search_talent = SearchTalent.find(params[:id]) 
	end

private
	def search_params
      params.require(:search_talent).permit(:school_year, :major, :expected_graduation, :school_id, :location_id)
    end

    def allowed_user
    # redirect_to root_url, notice: "You shall not pass!" unless current_user.try(:user_type) === "company" && current_user.company_verified? === true
    if current_user.user_type === "company" && unless current_user.company_verified? === true
    	redirect_to root_url, notice: "This account awaits validation, contact info@stutern.com!"
    		end
		end
	end
end
