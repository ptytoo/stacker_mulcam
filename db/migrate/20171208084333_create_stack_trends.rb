class CreateStackTrends < ActiveRecord::Migration
  def change
    create_table :stack_trends do |t|
      t.string :type_id
      t.string :type_name
      t.string :stack_name

      t.timestamps null: false
    end
  end
end
