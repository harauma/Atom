class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :company_name,  :limit => 255
      t.string :company_place, :limit => 255
      t.timestamps
    end
  end
end
