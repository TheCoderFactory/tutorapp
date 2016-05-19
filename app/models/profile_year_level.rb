class ProfileYearLevel < ActiveRecord::Base
  belongs_to :profile
  belongs_to :year_level
end
