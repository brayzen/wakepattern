class StaticController < ApplicationController
  def home
    if params[:handle].present? && params[:context].present?
      redirect_to give_feedback_path(handle: params[:handle], context: params[:context]) 
    elsif params[:handle].present?
      redirect_to give_feedback_path(handle: params[:handle]) 
    end
    header[:background] = header[:logo] = false
  end

  # testing
  def mail_it
    @user = {
      first_name: 'Brian',
      last_name: 'Ray',
      email: 'brian.ray.biz@gmail.com'
    }
    FeedbackMailer.send_notice_email(@user, EmailVerifier.validate(@user[:email])).deliver_now
    render 'feedback_mailer/send_notice_email'
  end
  
  def about
  end
  
  def mission
  end
  
  def correct_email_land
  end

  def incorrect_email_land
  end
end
