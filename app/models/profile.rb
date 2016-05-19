class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_subjects
  has_many :subjects, through: :profile_subjects
  has_many :profile_year_levels
  has_many :year_levels, through: :profile_year_levels

  after_create :add_tutor_role

  def add_tutor_role
    self.user.add_role :tutor
  end
end
