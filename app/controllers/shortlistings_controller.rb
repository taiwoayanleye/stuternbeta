class ShortlistingsController < ApplicationController
  before_action :set_shortlisting, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # def index
  #   @shortlistings = Shortlisting.all
  #   respond_with(@shortlistings)
  # end

  # def show
  #   respond_with(@shortlisting)
  # end

  # def new
  #   @shortlisting = Shortlisting.new
  #   respond_with(@shortlisting)
  # end

  # def edit
  # end

  def create
    # @shortlisting = current_user.shortlistings.build(:student_profile_id => p[student_profile_id])
    # @shortlisting = Shortlisting.new(shortlisting_params)
    # @shortlisting.company_profile_id = current_user.profileable_id
    # @stu_work_experience.student_profile_id = current_user.profileable_id
    # @shortlisting.user_id = current_user.id
    # @shortlisting.company_profile_id = current_user.profileable_id
    # company_profile = CompanyProfile.where(user_id: params[:user_id])
    @shortlisting = company_profile.shortlistings.build(pararms[:student_profile_id])
    if @shortlisting.save
      redirect_to company_profile_url(current_user.profileable_id)
      flash[:notice] = "Student shortlisted"
    else
      flash[:error] = "Student not shortlisted"
      # @shortlisting.save
      redirect_to root_url
    # respond_with(@shortlisting)
    end
  end

  # def update
  #   @shortlisting.update(shortlisting_params)
  #   respond_with(@shortlisting)
  # end

  def destroy
    @shortlisting.destroy
    respond_with(@shortlisting)
  end

  private
    def set_shortlisting
      @shortlisting = Shortlisting.find(params[:id])
    end

    def shortlisting_params
      params.require(:shortlisting).permit(:company_profile_id, :student_profile_id)
    end
end
