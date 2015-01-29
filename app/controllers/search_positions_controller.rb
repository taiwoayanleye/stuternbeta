class SearchPositionsController < ApplicationController
	def new
		@search_position = SearchPosition.new		
	end

	def create
		@search_position = SearchPosition.create!(search_position_params)
		# (params[:search_position])
		redirect_to @search_position
	end

	def show
		
	end

private
	def search_position_params
      params.require(:search_position).permit(:industry_id, :job_function_id, :location_id)
    end
end