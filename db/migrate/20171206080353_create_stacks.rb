class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.string :name
      t.string :site_url
      t.string :short_describe
      t.text :describe
      t.string :version
      t.references :stack_field, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
