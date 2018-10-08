class UsersController < ApplicationController
  before_action :authenticate_user!, except: :fuzzysearch

  def fuzzysearch
    @users = User.find_by_fuzzy_name(params[:name], limit: 10).map{ |u| u.name }
    render json: @users.as_json
  end

  def dashboard
    context = params[:context] || 'default'
    if context == 'new'
      @context = Context.new()
    else
      @context = current_user.contexts.find_by(handle: context)
    end
    @contexts = current_user.contexts
    @questions = @context.questions_users.where(deleted: [nil, false]).to_a.map { |qu| qu.question }.compact
    logger.info @questions
    (0..4).each do |i|
      if @questions[i].nil?
        @questions << Question.new
      end
    end
    @trait_averages = current_user.received_trait_averages.sort_by{ |td| td[:name] }
    @url = "www.wakepattern.com/#{current_user.handle}/#{@context.handle}"
  end
end
