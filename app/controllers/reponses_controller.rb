class ReponsesController < ApplicationController
  before_action :response_params, only: :create
  before_action :set_poll, only: :create

  def create
    @response = Reponse.new(response_params)
    @response.user = current_user
    if @response.save
      redirect_to poll_path(@poll)
    else
      render 'polls/show'
    end
  end

  private

  def set_poll
    @poll = @response.poll
  end

  def response_params
    params.require(:response).permit(:poll_option)
  end
end
