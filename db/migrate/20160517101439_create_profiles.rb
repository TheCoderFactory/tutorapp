class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :qualification
      t.integer :years_experience
      t.decimal :hourly_rate
      t.string :picture
      t.text :bio
      t.string :street
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
