class StudentProfilesController < ApplicationController
  before_action :set_student_profile, only: [:show, :edit, :update, :destroy]
  
  #make sure the user is logged in
  before_action :authenticate_user!, :get_user
  # Stops current student users and non verified companies from accessing all actions except index and search
  before_action :allowed_user

  # GET /student_profiles
  # GET /student_profiles.json
  def index
    @student_profiles = StudentProfile.search(params[:search])
    # @student_profiles = StudentProfile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_profiles }
    end
  end


  # GET /student_profiles/1
  # GET /student_profiles/1.json
  def show
    if user_signed_in? && current_user.user_type == "student"
      @student_profile = current_user.profile
    else
      @student_profile =  StudentProfile.where(id: params[:id]).first
      # @student_profile =  StudentProfile.where(user_id: params[:id]).first 
    end
  
    @skills = @student_profile.skills
    @work_histories = @student_profile.stu_work_experiences
    @references = @student_profile.stu_references
    @interests = @student_profile.stu_interests
    @certifications = @student_profile.stu_certifications
  end

  # GET /student_profiles/1/edit
  def edit
    @student_profile = current_user.profile
    # redirect_to @student_profile
  end

  # PATCH/PUT /student_profiles/1
  # PATCH/PUT /student_profiles/1.json
  def update
    @student_profile = StudentProfile.find(params[:id])
    respond_to do |format|
      if @student_profile.update_attributes(student_profile_params)
        format.html { redirect_to student_profile_path(current_user.profileable_id), notice: 'Student profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_profile }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_profiles/1
  # DELETE /student_profiles/1.json
  def destroy
    @student_profile = current_user.profile
    @student_profile.destroy
    
    respond_to do |format|
      format.html { redirect_to student_profiles_url, notice: 'Student profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_profile
      if user_signed_in? && current_user.user_type == "student"
        @student_profile = current_user.profile
      else
        @student_profile =  StudentProfile.where(id: params[:id]).first 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_profile_params
      params.require(:student_profile).permit(:first_name, :last_name, :brief_summary, :school_id, :expected_graduation, :school_year, :last_completed_degree, :location_id, :major, :image, user_attributes: [ :id, :email, :password, :user_type ])
    end

    def allowed_user
      # redirect_to root_url, notice: "You shall not pass!" unless current_user.try(:user_type) === "company" && current_user.company_verified? === true
      if current_user.user_type === "company" && unless current_user.company_verified? === true
        redirect_to root_url, notice: "This account awaits validation, contact info@stutern.com!"
        end
      end
    end
  end
