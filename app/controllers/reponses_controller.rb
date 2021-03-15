class ReponsesController < ApplicationController
  before_action :response_params, only: :create

  def create
    @response = Reponse.find(response_params)
    @response.user = current_user
  end

  private

  def response_params
    params.require(:response).permit(:poll_option_id)
  end
end
