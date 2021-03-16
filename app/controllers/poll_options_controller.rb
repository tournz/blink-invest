class PollOptionsController < ApplicationController
  before_action :set_poll, only: [:new, :create]

  def new
    @poll_option = PollOption.new
  end

  def create
    @poll_option = PollOption.new(poll_option_params)
    @poll_option.poll = @poll
    if @poll_option.save
      redirect_to poll_path(@poll)
    else
      render :new
    end
  end

  private

  def poll_option_params
    params.require(:poll_option).permit(:content)
  end

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end
end
