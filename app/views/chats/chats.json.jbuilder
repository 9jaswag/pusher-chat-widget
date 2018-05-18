json.chats @chats do |chat|
  json.(chat, :id, :name, :message)
end
