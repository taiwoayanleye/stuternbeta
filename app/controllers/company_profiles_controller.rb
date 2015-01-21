class CompanyProfilesController < ApplicationController
  before_action :set_company_profile, only: [:show, :edit, :update, :destroy]

  #make sure the user is logged in
  # before_action :authenticate_user!, :get_user
  before_action :user_type_authentication, except: [:index, :show, 
                :internship, :social, :qanda]
  
  # GET /company_profiles
  # GET /company_profiles.json
  def index
    @company_profiles = CompanyProfile.all.page(params[:page]).order("created_at DESC")

  # GET /company_profiles/1
  # GET /company_profiles/1.json
  end

  def show
    if user_signed_in? && current_user.user_type == 'company'
      @company_profile = current_user.profile
    else
      @company_profile =  CompanyProfile.where(id: params[:id]).first
    end
    @office_photos = @company_profile.office_photos.all
  end

  # def who_we_are
  #   if user_signed_in? && current_user.user_type == 'company'
  #     @company_profile = current_user.profile
  #   else
  #     @company_profile =  CompanyProfile.where(id: params[:id]).first
  #   end
  # end

  def internship
    if user_signed_in? && current_user.user_type == 'company'
      @company_profile = current_user.profile
    else
      @company_profile =  CompanyProfile.where(id: params[:id]).first
    end
  end

  def social
    if user_signed_in? && current_user.user_type == 'company'
      @company_profile = current_user.profile
    else
      @company_profile =  CompanyProfile.where(id: params[:id]).first
    end
  end

  def qanda
    if user_signed_in? && current_user.user_type == 'company'
      @company_profile = current_user.profile
    else
      @company_profile =  CompanyProfile.where(id: params[:id]).first
    end
  end

  def social
    if user_signed_in? && current_user.user_type == 'company'
      @company_profile = current_user.profile
    else
      @company_profile =  CompanyProfile.where(id: params[:id]).first
    end
  end

  def new
    @company_profile = CompanyProfile.new
    @office_photo = @company_profile.office_photos.build
  end


  # GET /company_profiles/1/edit
  def edit
    @company_profile = current_user.profile
  end

    # def create
  #   @company_profile = current_user.company_profiles.build(company_profile_params)
  #   authorize @company_profile
  #   if @company_profile.save
  #     # to handle multiple images upload on create
  #     if params[:images]
  #       params[:images].each { |image|
  #         @company_profile.office_photos.create(images: image)
  #       }
  #     end
  #     flash[:notice] = "Your company_profile has been created."
  #     redirect_to @company_profile
  #   else 
  #     flash[:alert] = "Something went wrong."
  #     render :new
  #   end
  # end

  def create
    @company_profile = CompanyProfile.new(company_profile_params)

    respond_to do |format|
      if @company_profile.save
        params[ :office_photos ]['images'].each do |a|
          @office_photo = @company_profile.office_photos.create!( :images => a, :company_profile_id => @company_profile.id)
        end
        format.html { redirect_to @company_profile, notice: 'Company profile was successfully created'}
      else
        format.html { render action: 'new'}
      end
    end
  end

  # PATCH/PUT /company_profiles/1
  # PATCH/PUT /company_profiles/1.json
  def update
    @company_profile = CompanyProfile.where(id: params[:id]).first
      respond_to do |format|
        if @company_profile.update_attributes(company_profile_params)
          if params[:images]
            params[:images].each { |image|
              @company_profile.office_photos.create(images: image)
            }
          end
# =======
#     @company_profile = CompanyProfile.where(id: params[:id]).first
#       respond_to do |format|
#         if @company_profile.update_attributes(company_profile_params)
# >>>>>>> d2af34cda09616dfa7778396fba688dfed10d78f
# =======
#     @company_profile = current_user.profile
#       respond_to do |format|
#         if @company_profile.update_attributes(company_profile_params)
# >>>>>>> 040f14fa1fdc942a62ac0025b9a6938d190b3668
          format.html { redirect_to company_profile_path(current_user.profileable_id), notice: 'Company profile was successfully updated.' }
          format.json { render :show, status: :ok, location: @company_profile }
        else
          format.html { render action: "edit" }
          format.json { render json: @company_profile.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /company_profiles/1
  # DELETE /company_profiles/1.json
  def destroy
    # @company_profile = current_user.profile
    @company_profile.destroy
    respond_to do |format|
      format.html { redirect_to company_profiles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_profile
      # @company_profile = CompanyProfile.find(params[:company_profile])
      # @company_profile = CompanyProfile.where(id: params[:id])
      # @company_profile = current_user.company_profile.find(params[:id])
      if user_signed_in? && current_user.user_type == 'company'
        @company_profile = current_user.profile
      else
        @company_profile =  CompanyProfile.where(id: params[:id]).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_profile_params
      params.require(:company_profile).permit(:company_name, :description, :company_type, :number_of_employees, :website, :location, :founded, :reg_code, :verified, :image, :user_id, user_attributes: [ :id, :email, :password ], office_photos_attributes: [:id, :company_profile_id, :images])
    end

    def user_type_authentication
      unless current_user.try(:user_type) === "company"
        redirect_to root_path, notice: "Not allowed"
      end
    end
  end