class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :messages

  def get_chats
    chatroom_ids = Participant.where(user_id: id).pluck(:chatroom_id)
    chats = []
    chatroom_ids.each do|cid|
      chats.push(Chatroom.find(cid))
    end
    return chats
  end
end
