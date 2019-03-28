class ContextsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @context = current_user.contexts.build(context_params)
		#if we want to abbreviate context
    #@context.handle = @context.name[0] + @context.name[-1]
    check_default(@context, context_params)
    if @context.save
      save_questions(questions_params)
      redirect_to dashboard_path(@context.handle)
    else
      render '/users/dashboard'
    end
  end

  def update
    @context = Context.find_by(id: params[:id])
    check_default(@context, context_params)
    if @context.update_attributes(context_params)
      save_questions(questions_params)
      redirect_to dashboard_path(@context.handle)
    else
      render '/users/dashboard'
    end
  end

  def destroy
    @context = Context.find_by(id: params[:id])
    @context.destroy
    redirect_to dashboard_path
  end

  private
  def context_params
    params.require(:context).permit(:id, :handle, :name, :default)
  end
  
  def questions_params
    params.require(:context).permit(questions_attributes: [:text, :id])
  end

  def check_default(context, context_params)
    if context_params[:default] == true
      current_user.contexts.each do |uc|
        uc.update_attribute(:default, false)
        context.default = true
      end
    end
  end
  
  def save_questions(questions_params)
    questions_params[:questions_attributes].each do |key, q_param|
      if q_param[:id].blank? && q_param[:text].length > 0
        question = Question.new(q_param)
        question.save
        qu = @context.questions_users.build(user: current_user, question: question)
        qu.save
      end
    end
  end
end
