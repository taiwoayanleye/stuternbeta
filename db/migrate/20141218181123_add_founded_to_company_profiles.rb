class AddFoundedToCompanyProfiles < ActiveRecord::Migration
  def change
    add_column :company_profiles, :founded, :integer
  end
end
