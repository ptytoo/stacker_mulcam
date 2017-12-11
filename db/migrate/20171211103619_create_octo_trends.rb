class CreateOctoTrends < ActiveRecord::Migration
  def change
    create_table :octo_trends do |t|
      t.string :table_id
      t.string :table_title
      t.string :content_name
      t.string :content_figure

      t.timestamps null: false
    end
  end
end
