class CreateStackFields < ActiveRecord::Migration
  def change
    create_table :stack_fields do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
