class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
    @message = Message.new
    @dummy = helpers.dummy()
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    if @message.save
      ActionCable.server.broadcast 'chatting_channel', message: render_message(@message)
      respond_to do | format |
        format.html { redirect_to messages_path, notice: "Message was successfully sent."}
        format.js { head :ok }
      end
    else
      respond_to do | format |
        flash[:error] = 'Message was not sent.'
        format.html { redirect_to messages_path }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit :content
  end

  def render_message(message)
    render( message )
  end

end
