class MessagesController < ApplicationController

  before_action :authenticate_user!
  respond_to :html, :js

  def create
    # @message = Message.new(message_params)
    # @message.user_id = current_user.id
    # respond_to do |format|
    #   if @message.save
    #     format.html{ return redirect_to :back  }
    #     format.js {   }
    #     format.json { render :show, status: :created, location: @post }
    #   else
    #     format.html { render 'home/index' }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    respond_to do |format|
      if @message.save
        sync_new @message
        format.js{ }
      end
    end

    respond_with { @message }
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end

  def authorize_user
    if current_user!= @message.user
      return redirect_to '/'
    end
  end
end
