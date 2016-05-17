class Profile < ActiveRecord::Base
  belongs_to :user

  after_create :add_tutor_role

  def add_tutor_role
    self.user.add_role :tutor
  end
end
