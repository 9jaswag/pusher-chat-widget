class ChatsController < ApplicationController
  def index
  end

  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.html {  }
        format.json { render: :show, location: @chat }
      else
        format.json { render: :new, notice: 'not created' }
      end
    end
  end

  def new
  end

  def show
  end

  def dashboard
    @chats = Chats.all.order(:id)
  end

  private
    def chat_params
      params.require(:chat).permit(:message, :name, :chatroom_id)
    end
end
