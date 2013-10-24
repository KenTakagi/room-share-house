json.array!(@inquiries) do |inquiry|
  json.extract! inquiry, :to_userid, :from_userid, :subject, :body, :sent_time, :deleted_time_by_sender, :deleted_time_by_recipient
  json.url inquiry_url(inquiry, format: :json)
end
