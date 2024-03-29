RailsAdmin.config do |config| 
  ADMIN_EMAILS = ['taiwo@stutern.com']

  config.current_user_method { current_user }
  ### Popular gems integration

  ## == Devise ==
    config.authenticate_with {} 
#   config.authenticate_with do
#     warden.authenticate! scope: :user
#   end

  # config.current_user_method &:current_admin


config.authorize_with do
  is_admin  = ADMIN_EMAILS.include?(current_user)
    if current_user
      redirect_to main_app.root_path unless is_admin?
    end
end

  

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
