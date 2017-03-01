json.array!(@mail_instances) do |mail_instance|
  json.extract! mail_instance, :id, :MAIL_NO, :USER_NO, :TITLE, :CONTENT, :SENDER, :SENDER_ACTOR_ID, :SENDER_USER_NO, :OPENED, :REWARD, :END_DATE, :MAIL_TYPE
  json.url mail_instance_url(mail_instance, format: :json)
end
