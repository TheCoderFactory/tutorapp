class YearLevel < ActiveRecord::Base
  has_many :profile_year_levels
  has_many :profiles, through: :profile_year_levels
end
