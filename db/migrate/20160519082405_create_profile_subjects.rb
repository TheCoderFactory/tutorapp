class CreateProfileSubjects < ActiveRecord::Migration
  def change
    create_table :profile_subjects do |t|
      t.references :profile, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
