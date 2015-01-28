class ChangeIndustryIdFormatInCompanyProfiles < ActiveRecord::Migration
  def up
  	change_column :company_profiles, :industry_id, :integer
  end

  def down
  	change_column :company_profiles, :industry_id, :string
  end
end
