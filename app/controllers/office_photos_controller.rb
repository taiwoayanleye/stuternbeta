class OfficePhotosController < ApplicationController
	before_action :set_office_photo, only: [:show, :edit, :update, :destroy]

	def index
		@office_photos = OfficePhoto.all
	end

	def show
	end

	def new
		@office_photo = OfficePhoto.new
	end

	def edit
	end

	def create
	  @office_photo = OfficePhoto.new(office_photo_params)
	  
	  respond_to do |format|
	  	if @office_photo.save
	  		format.html { redirect_to @office_photo, notice: "Office photo was succcefully creadted" }
	  		format.html { render :show, status: :created, location: @office_photo }
	  	else
	  		format.html { render :new }
	  		format.html { render json: @office_photo.errors, status: :unprocessable_entity }
	  	end
	  end
	end

	def update
		respond_to do |format|
			if @office_photo.update(office_photo_params)
				format.html { redirect_to @office_photo.company_profile, notice: "Office photo was succcefully updated" }
				format.json { render :show, status: :ok, location: @office_photo }
			else
				format.html { render :edit }
				format.json { render json: @office_photo.erros, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@office_photo.destroy
		respond_to do |format|
			format.html { redirect_to office_photos_url, notice: "Office photo was succcefully destroyed" }
			format.json { head :no_content }
		end
	end

	private
		def set_office_photo
			@office_photo = OfficePhoto.find(params[:id])
		end

		def office_photo_params
			params.require(:office_photo).permit(:company_profile_id, :images)
		end
end
