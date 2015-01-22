class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # # Redirect to the login page if the user was not logged in.
  # before_action :authenticate_user!


  #strong parameters to customize our views for Devise in Rails 4
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :admin?
  helper_method :current_admin

  #Returns the type of profile for the current user
  def get_profile_type
    current_user.user_type
  end


  #Gets the current user's get_profile_type
  def get_user
    current_user.profile
  end

  #Redirects the user after successful sign in
  def after_sign_in_path_for(user)
    user_type = current_user.user_type
    if user_type == "student"
      if !@user.profile.first_name.nil?
        search_job_postings_url
      else
        edit_student_profile_path(:id)
      end
    else
      if !@user.profile.verified? === true
        edit_company_profile_path(:id)
      else
        new_search_url
        # search_student_profiles_url
      end
    end
  end

  def admin?
    return true if current_user.try(:admin)
  end

  def current_admin
    return current_user if current_user.try(:admin)
  end

  protected

  #needed for strong parameters to customize our views for Devise in Rails 4
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_type
  end

  def verified?
    unless current_user || current_user.company_verified?
      redirect_to root_path, notice: "Not allowed"
    end
  end
end
