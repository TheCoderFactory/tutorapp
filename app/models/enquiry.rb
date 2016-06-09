class Enquiry < ActiveRecord::Base
  validates :email, :body, :name, presence: true
end
