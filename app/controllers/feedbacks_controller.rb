class FeedbacksController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = current_or_guest_user.sent_feedbacks.last 10

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @feedbacks.as_json }
    end
  end

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def edit
  end

  def create
    @feedback = Feedback.new feedback_params
    @feedback.sender = current_or_guest_user
    receiver = User.find_or_create_by(email: feedback_params[:to_email])

    receiver.save! validate: false unless receiver.persisted?
    @feedback.reciever = receiver
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_path }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @feedback.update(feedback_params)
        format.html { redirect_to @feedback }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url }
      format.json { head :no_content }
    end
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:message, :to_email, :to_first_name, :to_last_name, feedback_traits_attributes: [:name, :rating])
    end
end
