class ResponsesController < ApplicationController
  before_action :response_params, only: :create

  def create
    @response = Response.new(response_params)
    @poll = @response.poll
    @response.user = current_user
    if @response.save
      redirect_to chatroom_path(@poll.chatroom)
    else
      render 'polls/show'
    end
  end

  private

  def response_params
    params.require(:response).permit(:poll_option_id)
  end
end
