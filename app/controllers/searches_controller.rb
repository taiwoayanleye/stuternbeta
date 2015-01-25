class SearchesController < ApplicationController
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
      params.require(:search).permit(:keywords, :school_year, :major, :expected_graduation, :school_id)
    end
end
