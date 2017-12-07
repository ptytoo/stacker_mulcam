class CreateServiceStacks < ActiveRecord::Migration
  def change
    create_table :service_stacks do |t|
      t.references :service, index: true, foreign_key: true
      t.references :stack, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
