class EnquiryJob
  include SuckerPunch::Job

  def perform(enquiry_id)
    EnquiryMailer.confirmation(enquiry_id).deliver
    EnquiryMailer.notification.deliver
    # raise NotImplementedError
  end
end
