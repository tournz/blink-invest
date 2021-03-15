class PollsController < ApplicationController
  before_action :set_chatroom, only: [:new, :create]

  def new
    @poll = Poll.new
  end

  def create
    @poll = Poll.new(poll_params)
    @poll.chatroom = @chatroom
    @poll.user = current_user
    if @poll.save
      Message.create(content: "Poll: #{@poll.title}", user: @poll.user, chatroom: @poll.chatroom, poll: @poll)
      redirect_to new_poll_poll_option_path(@poll)
    else
      render :new
    end
  end

  def show
    @poll = Poll.find(params[:id])
    @poll_option = PollOption.new(poll: @poll)
    @poll_options = @poll.poll_options
    @chatroom = @poll.chatroom
    @response = Response.new
  end

  private

  def set_chatroom
    @chatroom = Chatroom.find(params[:chatroom_id])
  end

  def poll_params
    params.require(:poll).permit(:title)
  end
end
