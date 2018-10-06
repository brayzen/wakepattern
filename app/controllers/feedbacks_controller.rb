class FeedbacksController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    if params[:type] == 'sent'
      @feedbacks = current_or_guest_user.sent_feedbacks.includes(:receiver, feedback_traits: [:trait])
      @feedbacks.order(created_at: :desc)
      @feedbacks.order(name: :asc) if params[:sort] == 'name'
    else
      @feedbacks = current_or_guest_user.received_feedbacks.includes(:sender, feedback_traits: [:trait])
      @feedbacks.order(created_at: :desc)
      @feedbacks.order(name: :asc) if params[:sort] == 'name'
    end
  end

  def show
  end

  def new
    @feedback = Feedback.new
    @feedback.receiver = if params[:handle]
      User.find_by_handle params[:handle]
    else
      User.new
    end

    if current_user.nil? && @feedback.receiver.nil?
      render_not_found
    else
      @feedback.responses = @feedback.receiver.questions.map{ |q| q.responses.new feedback: @feedback }
    end
  end

  def edit
  end

  def create
    fp = feedback_params
    rp = fp.delete :receiver_attributes
    @feedback = Feedback.new fp
    @feedback.sender = current_or_guest_user

    # this is only temporary.  need to determine how we are handling errors
    rp = feedback_params[:receiver_attributes]
    render 'errors/not_found' unless rp

    @feedback.receiver = if rp[:id]
      User.find rp[:id]
    elsif rp[:email]
      User.find_by_email rp[:email]
    elsif rp[:handle]
      User.find_by_handle rp[:handle]
    end

    @feedback.receiver = User.new(rp) if @feedback.receiver.nil?
    
    if @feedback.save
      redirect_to @feedback 
    else
      render :new 
    end
  end

  def update
    if @feedback.update(feedback_params)
      redirect_to @feedback 
    else
      render :edit 
    end
  end

  def destroy
    @feedback.destroy
    redirect_to feedbacks_url
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:message, feedback_traits_attributes: [:trait_id, :rating], receiver_attributes: [:id, :email, :handle], responses_attributes: [:question_id, :response])
    end
end
