class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :site_url
      t.string :logo_url
      t.text :describe
      t.references :company, index: true, foreign_key: true
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :access_token
      t.string :access_token_secret
      t.string :refresh_token
      t.datetime :expires_at
      t.text :auth


      t.timestamps
    end
  end
end
