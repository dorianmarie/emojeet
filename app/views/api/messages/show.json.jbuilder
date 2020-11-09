json.id @message.id
json.content @message.content
json.user do
  json.id @message.user.id
  json.name @message.user.name
end
