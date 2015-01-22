class SearchesController < ApplicationController
	def new
		@search  = Search.new
	end

	def create
		@search = Search.create!(params[:search_params])
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

private
	def search_params
      params.require(:search).permit( :school, :expected_graduation, :school_year, :last_completed_degree, :major)
    end
end
