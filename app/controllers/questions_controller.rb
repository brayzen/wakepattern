class QuestionsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    question = Question.new(question_params)
    question.save
    qu = current_user.questions_users.build(question: question)
    if qu.save
      redirect_to dashboard_path
    else
      question.destroy
      redirect_to dashboard_path
    end
  end

  def update
    question = Question.find(params[:id])
    if question.update_attributes(question_params)
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to dashboard_path
  end

  private
  def question_params
    params.require(:question).permit(:text, :id)
  end
end
