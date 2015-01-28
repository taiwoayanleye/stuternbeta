class ChangeCompanyTypeInCompanyProfiles < ActiveRecord::Migration
  def change
  	rename_column :company_profiles, :company_type, :industry_id
  end
end
