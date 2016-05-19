class Subject < ActiveRecord::Base
  has_many :profile_subjects
  has_many :profiles, through: :profile_subjects
end
