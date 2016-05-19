class ProfileSubject < ActiveRecord::Base
  belongs_to :profile
  belongs_to :subject
end
