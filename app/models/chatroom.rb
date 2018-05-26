class Chatroom < ActiveRecord::Base
  has_many :messages

  def get_Messages
    messages = Message.where(chatroom_id: id)
    return messages
  end

  def getParticipants
    participants = Participant.where(chatroom_id: id)
    return participants
  end
end
