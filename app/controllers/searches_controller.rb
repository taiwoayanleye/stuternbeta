class SearchesController < ApplicationController
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
		@search = Search.find(params[:id]) 
		# @search = Search.new(search_params)
	end

private
	def search_params
      params.require(:search).permit(:keywords, :school_year, :major, :expected_graduation, :school_id :residential_address)
    end

    def allowed_user
    # redirect_to root_url, notice: "You shall not pass!" unless current_user.try(:user_type) === "company" && current_user.company_verified? === true
    if current_user.user_type === "company" && unless current_user.company_verified? === true
    	redirect_to root_url, notice: "This account awaits validation, contact info@stutern.com!"
    		end
		end
	end
end
