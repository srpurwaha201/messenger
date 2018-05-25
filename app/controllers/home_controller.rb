class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @chats = current_user.get_chats
  end
end
