class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :site_url
      t.string :logo_url
      t.text :describe
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
