class CreateCompanyFields < ActiveRecord::Migration
  def change
    create_table :company_fields do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
