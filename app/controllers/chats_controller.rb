class ChatsController < ApplicationController
  def index
    @chats = Chatroom.all
  end

  def create
    @chat = Chat.new(chat_params)

    respond_to do |format|
      if @chat.save
        format.json { render :show, status: :created, location: @chat }
      else
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @chat = Chat.new
  end

  def show
    @chats = Chat.where(chatroom_id: params[:id])

    respond_to do |format|
      if @chats
        format.json { render :chats, status: :ok }
      else
        format.json { render json: @chats.errors, status: :unprocessable_entity }
      end
    end
  end

  def dashboard
    # @chats = Chats.all.order(:id)
  end

  private
    def chat_params
      params.require(:chat).permit(:message, :name, :chatroom_id)
    end
end
