class SearchesController < ApplicationController
	#make sure the user is logged in
	before_action :authenticate_user!, :get_user
	# Stops current student users and non verified companies from accessing all actions except index and search
	before_action :allowed_user

	def new
		@search  = Search.new
	end

	def create
	@search = Search.create!(search_params)
	# (params[:search_params])
	redirect_to @search
	end

	def show
		# @saved = SavedStudentProfile.where(company_profile_id: current_user.profileable_id)

	 #    if params[:save_search]
	 #      @saved_student_profile = SavedStudentProfile.new
	 #      @saved_student_profile.company_profile_id = current_user.profileable_id
	 #      @saved_student_profile.school_text = params[:school_text]
	 #      @saved_student_profile.year_text = params[:year_text]
	 #      @saved_student_profile.skill_text = params[:skill_text]

	 #      respond_to do |format|
	 #        if @saved_student_profile.save
	 #          format.html { redirect_to :back, notice: 'Saved student profile was successfully created.' }
	 #          format.json { render json: @saved_student_profile, status: :created, location: @saved_student_profile }
	 #        else
	 #          format.html { render action: "new" }
	 #          format.json { render json: @saved_student_profile.errors, status: :unprocessable_entity }
	 #        end
	 #      end
	 #    end
	    @student_profiles = StudentProfile.where(params[:search])
		@search = Search.find(params[:id]) 
		# @search = Search.new(search_params)
	end

private
	def search_params
      params.require(:search).permit(:keywords, :school_year, :major, :expected_graduation, :school_id, :location_id)
    end

    def allowed_user
    # redirect_to root_url, notice: "You shall not pass!" unless current_user.try(:user_type) === "company" && current_user.company_verified? === true
    if current_user.user_type === "company" && unless current_user.company_verified? === true
    	redirect_to root_url, notice: "This account awaits validation, contact info@stutern.com!"
    		end
		end
	end
end
