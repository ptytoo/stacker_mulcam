class CreateEduPaths < ActiveRecord::Migration
  def change
    create_table :edu_paths do |t|
      t.references :stack, index: true, foreign_key: true
      t.string :url

      t.timestamps null: false
    end
  end
end
