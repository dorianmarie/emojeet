json.id @user.id
json.name @user.name
json.messages @user.messages do |message|
  json.id message.id
  json.content message.content
end
