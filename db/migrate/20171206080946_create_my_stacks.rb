class CreateMyStacks < ActiveRecord::Migration
  def change
    create_table :my_stacks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
