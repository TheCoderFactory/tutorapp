class CreateProfileYearLevels < ActiveRecord::Migration
  def change
    create_table :profile_year_levels do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :year_level, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
