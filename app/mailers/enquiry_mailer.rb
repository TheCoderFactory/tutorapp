class EnquiryMailer < ApplicationMailer

  def confirmation(enquiry_id)
    @enquiry = Enquiry.find(enquiry_id)
    @greeting = "Hi"
    # @enquiry = enquiry

    mail to: @enquiry.email
  end

  def notification
    @greeting = "Hi"

    mail to: "jamie@coderfactory.com"
  end
end
