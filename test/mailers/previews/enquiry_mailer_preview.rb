# Preview all emails at http://localhost:3000/rails/mailers/enquiry_mailer
class EnquiryMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/enquiry_mailer/confirmation
  def confirmation
    EnquiryMailer.confirmation
  end

  # Preview this email at http://localhost:3000/rails/mailers/enquiry_mailer/notification
  def notification
    EnquiryMailer.notification
  end

end
