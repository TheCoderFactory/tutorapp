class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :profile_subjects
  has_many :subjects, through: :profile_subjects
  has_many :profile_year_levels
  has_many :year_levels, through: :profile_year_levels

  geocoded_by :full_street_address
  after_validation :geocode

  after_create :add_tutor_role

  def full_street_address
    [street, suburb, state, postcode, country].compact.join(', ')
  end

  def add_tutor_role
    self.user.add_role :tutor
  end

  def self.search(search)
    where("subject LIKE ?", "%#{search}%")
  end
end
