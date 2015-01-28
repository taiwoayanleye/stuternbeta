class ShortlistingsController < ApplicationController
  # before_action :set_shortlisting, only: [:show, :edit, :update, :destroy]

  def create
    # @company_profile = CompanyProfile.find(params[:shortlisting][:company_profile_id])
    # current_user.shortlisting!(@company_profile)
    # redirect_to @company_profile
    company_profile = CompanyProfile.where(:user_id => current_user.id)

    @shortlisting = company_profile.shortlisting.build(:student_profile_id => params[:student_profile_id])
    if @shortlisting.save
      flash[:notice] = "Student shortlisted"
      redirect_to company_profile_url(current_user.profileable_id)
    else
      flash[:error] = "Student not shortlisted"
      redirect_to root_url
    end
  end

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
