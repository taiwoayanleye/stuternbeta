class CreateOfficePhotos < ActiveRecord::Migration
  def change
    create_table :office_photos do |t|
      t.integer :company_profile_id
      t.string :images

      t.timestamps
    end
  end
end
