module ApplicationHelper
  def unread_messages(user_id)
    unread_messages_count = Message.where('receiver_id = ? and read > ?', user_id, Time.now).count
    html = ('<span class="label">' + unread_messages_count.to_s + '</span>').html_safe
  end
end
