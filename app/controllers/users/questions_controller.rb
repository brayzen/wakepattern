class Users::QuestionsController < ApplicationController
  before_action :authenticate_user!

  # GET /questions
  # GET /questions.json
  def index
    @questions = current_user.questions.all
  end

  # # GET /questions/new
  # def new
  #   @question = Question.new
  # end

  # def create
  #   @question = Question.new(question_params)

  #   respond_to do |format|
  #     if @question.save
  #       format.html { redirect_to @question, notice: 'Question was successfully created.' }
  #       format.json { render :show, status: :created, location: @question }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @question.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  private
    def question_params
      params.require(:question).permit(:text)
    end
end
