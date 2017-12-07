class CreateGittrends < ActiveRecord::Migration
  def change
    create_table :gittrends do |t|
      t.string :name
      t.string :year
      t.string :quarter
      t.string :count

      t.timestamps null: false
    end
  end
end
