class FeedbacksController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = current_or_guest_user.sent_feedbacks.includes(:receiver, feedback_traits: [:trait]).last 10

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @feedbacks.as_json }
    end
  end

  def show
  end

  def new
    @feedback = Feedback.new
    if params[:handle]
      @feedback.receiver = User.find_by_handle params[:handle]
    else
      @feedback.receiver = User.new
    end
    render_not_found if current_user.nil? && @feedback.receiver.nil?
  end

  def edit
  end

  def create
    @feedback = Feedback.new feedback_params
    @feedback.sender = current_or_guest_user

    if feedback_params[:receiver_email]
      @feedback.receiver = User.find_by_email feedback_params[:receiver_email]
    end

    if @feedback.receiver.nil? && feedback_params[:receiver_handle]
      @feedback.receiver = User.find_by_handle feedback_params[:receiver_handle].downcase
    end

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to @feedback }
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
      params.require(:feedback).permit(:message, :receiver_id, :receiver_email, :receiver_handle, feedback_traits_attributes: [:trait_id, :rating])
    end
end
