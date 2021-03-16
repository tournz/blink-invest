class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to projects_path
    #render "products/show"
     # app/views/projects/index.html.erb #/projects
    else
      render :new
    end 
    #else 
    #  render 
    #end
    #if @quiz.save
     # redirect_to projects
   # else
    #  "please enter the answers"
  end
  

  def quiz_params
    params.require(:quiz).permit(:risk, :horizon, :income_inv_percentage, :annual_income, :risk_case, :age)
  end
end
