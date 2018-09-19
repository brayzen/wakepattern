class FeedbacksController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create]
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json do
        @feedbacks = if params[:type] == 'sent'
          current_or_guest_user.sent_feedbacks.includes(:receiver, feedback_traits: [:trait])
        else
          current_or_guest_user.received_feedbacks.includes(:sender, feedback_traits: [:trait])
        end#.sort_by(:created_at).last 10

        return ActionCable.server.broadcast 'feedbacks', feedbacks: @feedbacks.to_json
      end
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
    @feedback.responses = @feedback.receiver.questions.map{ |q| q.responses.new feedback: @feedback }
    render_not_found if current_user.nil? && @feedback.receiver.nil?
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
      params.require(:feedback).permit(:message, feedback_traits_attributes: [:trait_id, :rating], receiver_attributes: [:id, :email, :handle], responses_attributes: [:question_id, :response])
    end
end
