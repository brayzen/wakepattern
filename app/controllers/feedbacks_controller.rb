class FeedbacksController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    if params[:type] == 'sent'
      @feedbacks = current_or_guest_user.sent_feedbacks.includes(:receiver, feedback_traits: [:trait])
      if params[:sort] == 'name'
        @feedbacks = @feedbacks.includes(:receiver).order('users.handle')
      else
        @feedbacks = @feedbacks.order(created_at: :desc)
      end
    else
      @feedbacks = current_or_guest_user.received_feedbacks.includes(:sender, feedback_traits: [:trait])
      if params[:sort] == 'name'
        @feedbacks = @feedbacks.includes(:receiver).order('users.handle')
      else
        @feedbacks = @feedbacks.order(created_at: :desc)
      end
    end
  end

  def show
  end

  def new
    @feedback = Feedback.new
    if params[:handle]
      @user = User.find_by_handle params[:handle]
    else
      @user = User.new
    end

    if current_user.nil? && @user.nil?
      render_not_found
    else
      @feedback.receiver = @user
      context = params[:context]
      if context == 'new' || @user.contexts.length == 0
        @context = Context.new()
      elsif context.nil?
        @context = @user.contexts.find_by(default: true)
        @context = @user.contexts.first if @context.nil?
      else
        @context = @user.contexts.find_by(handle: context)
      end

      @feedback.responses = @context.questions.map{ |q| q.responses.new feedback: @feedback }
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
			set_receiver(@feedback.receiver)
      redirect_to controller: 'beta_users', action: 'new'
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
